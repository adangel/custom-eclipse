#!/bin/bash

cd distribution/target/products

for i in *.tar.gz; do
    echo "Working on $i..."
    tar xfz $i
    rm $i
    (
        cd ${i:0:20}*
        sed -i.backup "{
            s/-javaagent:.\+\/\(plugins\/com\.zeroturnaround\.eclipse\.optimizer\.plugin_[0-9]\+\.[0-9]\+\.[0-9]\+\/agent\/eclipse-optimizer-agent.jar\)/-javaagent:\1/
            s/-javaagent:.\+\/\(plugins\/lombok_[0-9]\+\.[0-9]\+\.[0-9]\+\/target\/lib\/lombok.jar\)/-javaagent:\1/
        }" eclipse.ini
        sed -i.backup "{
            N
            s/-showsplash\norg.eclipse.platform//
        }" eclipse.ini
    )
    tar cfz $i ${i:0:20}*/
    rm -rf ${i:0:20}*/
done

for i in *.zip; do
    echo "Working on $i..."
    unzip -q $i
    rm $i

    (
        cd ${i:0:20}*
        if [ -d Contents ]; then
          sed -i.backup "{
                s/-javaagent:.\+\/\(plugins\/com\.zeroturnaround\.eclipse\.optimizer\.plugin_[0-9]\+\.[0-9]\+\.[0-9]\+\/agent\/eclipse-optimizer-agent.jar\)/-javaagent:..\/..\/..\/\1/
                s/-javaagent:.\+\/\(plugins\/lombok_[0-9]\+\.[0-9]\+\.[0-9]\+\/target\/lib\/lombok.jar\)/-javaagent:..\/..\/..\/\1/
          }" Contents/Eclipse/eclipse.ini
          sed -i.backup "{
              N
              s/-showsplash\norg.eclipse.platform//
          }" Contents/Eclipse/eclipse.ini
        else
          sed -i.backup "{
                s/-javaagent:.\+\/\(plugins\/com\.zeroturnaround\.eclipse\.optimizer\.plugin_[0-9]\+\.[0-9]\+\.[0-9]\+\/agent\/eclipse-optimizer-agent.jar\)/-javaagent:\1/
                s/-javaagent:.\+\/\(plugins\/lombok_[0-9]\+\.[0-9]\+\.[0-9]\+\/target\/lib\/lombok.jar\)/-javaagent:\1/
          }" eclipse.ini
          sed -i.backup "{
              N
              s/-showsplash\r?\norg.eclipse.platform//
          }" eclipse.ini
        fi
    )

    zip -q -r $i ${i:0:20}*/
    rm -rf ${i:0:20}*/
done

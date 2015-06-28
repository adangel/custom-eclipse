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
        if [ -d Eclipse.app ]; then
          eclipse_ini=Eclipse.app/Contents/MacOS/eclipse.ini
        else
          eclipse_ini=eclipse.ini
        fi

        sed -i.backup "{
            s/-javaagent:.\+\/\(plugins\/com\.zeroturnaround\.eclipse\.optimizer\.plugin_[0-9]\+\.[0-9]\+\.[0-9]\+\/agent\/eclipse-optimizer-agent.jar\)/-javaagent:\1/
            s/-javaagent:.\+\/\(plugins\/lombok_[0-9]\+\.[0-9]\+\.[0-9]\+\/target\/lib\/lombok.jar\)/-javaagent:\1/
        }" $eclipse_ini
    )
    zip -q -r $i ${i:0:20}*/
    rm -rf ${i:0:20}*/
done

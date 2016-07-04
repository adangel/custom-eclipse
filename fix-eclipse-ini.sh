#!/bin/bash

cd distribution/target/products

update_eclipse_ini() {
    local file=$1
    rm $file
    cd ${file:0:20}*[^zp]
    sed -i.backup "{
        s/-javaagent:.\+\/\(plugins\/com\.zeroturnaround\.eclipse\.optimizer\.plugin_[0-9]\+\.[0-9]\+\.[0-9]\+\/agent\/eclipse-optimizer-agent.jar\)/-javaagent:\1/
        s/-javaagent:.\+\/\(plugins\/lombok_[0-9]\+\.[0-9]\+\.[0-9]\+\/target\/lib\/lombok.jar\)/-javaagent:\1/
    }" eclipse.ini
    sed -i.backup "{
        N
        s/-showsplash\norg.eclipse.platform//
    }" eclipse.ini
    cd ..
}
update_eclipse_ini_macosx() {
    local file=$1
    rm $file
    cd ${file:0:20}*.app
    sed -i.backup "{
        s/-javaagent:.\+\/\(plugins\/com\.zeroturnaround\.eclipse\.optimizer\.plugin_[0-9]\+\.[0-9]\+\.[0-9]\+\/agent\/eclipse-optimizer-agent.jar\)/-javaagent:..\/Eclipse\/\1/
        s/-javaagent:.\+\/\(plugins\/lombok_[0-9]\+\.[0-9]\+\.[0-9]\+\/target\/lib\/lombok.jar\)/-javaagent:..\/Eclipse\/\1/
    }" Contents/Eclipse/eclipse.ini
    sed -i.backup "{
        N
        s/-showsplash\norg.eclipse.platform//
    }" Contents/Eclipse/eclipse.ini
    cd ..
}



for i in *linux*.tar.gz; do
    if [ -e $i ]; then
        echo "Working on $i..."
        tar xfz $i
        update_eclipse_ini $i
        tar cfz $i ${i:0:20}*[^zp]/
        rm -rf ${i:0:20}*[^zp]/
    else
        echo "Skipping linux..."
    fi
done

for i in *macosx*.zip; do
    if [ -e $i ]; then
        echo "Working on $i..."
        unzip -q $i
        update_eclipse_ini_macosx $i
        zip -q -r $i ${i:0:20}*.app/
        rm -rf ${i:0:20}*.app/
    else
        echo "Skipping macosx..."
    fi
done

for i in *win32*.zip; do
    if [ -e $i ]; then
        echo "Working on $i..."
        unzip -q $i
        update_eclipse_ini $i
        zip -q -r $i ${i:0:20}*[^zp]/
        rm -rf ${i:0:20}*[^zp]/
    else
        echo "Skipping win32..."
    fi
done

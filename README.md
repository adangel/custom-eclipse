# Branded Eclipse Example

Build an own, branded eclipse with a couple of plugins already installed an selected.

## Download

Prepackaged eclipse archives can be downloaded here:

<https://sourceforge.net/projects/custom-eclipse/files/>


## How-To create eclipse yourself

1.  Make sure, you have the necessary utilities installed: `apt-get install zip unzip tar sed java svn wget git bash`.
2.  Clone this repository: `git clone https://github.com/adangel/custom-eclipse`
3.  Review `create-mirror.sh` and comment/uncomment the update sites you want to mirror
4.  Execute `bash create-mirror.sh`
5.  Drink coffee. This can take a while. If every update site is enabled, you'll download about 5 gigabytes.
    All the downloaded stuff will be placed under `temp/`. Under `temp/p2-mirror` is a merged p2 repository
    which contains all the artifacts of the mirrored repositories.
6.  Have a look at the module "branding". This is a eclipse plugin which brings
    *   A splash screen. Replace "splash-base.bmp" with your own.
    *   The project uses "splasher-maven-plugin". Update the property `splash-subtitle` in the top-level pom.xml file.
    *   Icons. Replace icon*.* with your own.
    *   About dialog in eclipse. See plugin.xml/plugin.properties for details. See also about.gif for the logo
        in the about dialog.
7.  Have a look at "feature/feature.xml". This selects hopefully all the features, that come with the default
    Eclipse JEE bundle. You can add/remove features and plugins.
8.  Have a look at "feature-plugins/feature.xml". This selects all additional features/plugins from external sites
    that have been mirrored.
9.  Have a look at the top-level pom.xml file. You can specify for which platforms you want to create an
    own eclipse distribution. See the plugin "target-platform-configuration" and the environments configuration.
10. Execute `mvn clean package`. The result is stored under "distribution/target/products/".
11. Last step: Execute `fix-javagent-paths.sh`. This will change the absolute paths to the java agents
    in "eclipse.ini" to relative ones and repackage the eclipse archives.
12. The final result is still stored under "distribution/target/products/".



## Starting Eclipse

The created eclipse distribution contains two javaagents: lombok and optimizer-for-eclipse.
If eclipse doesn't start, you maybe need to adjust the paths in `eclipse.ini`.

## Plugins

For the list of plugins, see [create-mirror.sh](https://github.com/adangel/custom-eclipse/blob/master/create-mirror.sh).

Highlights are:

*   Findbugs, Checkstyle, PMD
*   EclEmma - <http://eclemma.org/>
*   Spring Tools Suite - <https://spring.io/tools/sts/all>
*   JBoss Tools - <http://tools.jboss.org/>
*   Maven Development Tools - <https://github.com/ifedorenko/com.ifedorenko.m2e.mavendev>
*   Optimizer for Eclipse - <http://zeroturnaround.com/free/optimizer-for-eclipse/>
*   Aptana Studio - <http://www.aptana.com/products/studio3/download>


## References

* [Eclipse Magazin](http://www.eclipse-magazin.de), Issue 5.12, Page 52
* <http://wiki.eclipse.org/Tycho/Demo_Projects/RCP_Application>
* <https://github.com/rombert/scripts/blob/master/bin/mirror_eclipse_update_site.sh>
* <http://wiki.eclipse.org/Equinox_p2_Repository_Mirroring>
* <http://stackoverflow.com/questions/1371176/downloading-eclipse-plug-in-update-sites-for-offline-installation>
* <http://wiki.eclipse.org/Equinox/p2/Publisher#Features_And_Bundles_Publisher_Application>
* <http://wiki.eclipse.org/Tycho/Packaging_Types>
* <http://eclipse.org/tycho/sitedocs/tycho-p2/tycho-p2-director-plugin/archive-products-mojo.html>
* <http://stackoverflow.com/questions/8583878/rename-zip-files-created-by-tycho-p2-director-plugin>
* <http://wiki.eclipse.org/Simultaneous_Release>
* <http://wiki.eclipse.org/Eclipse_Project_Update_Sites>



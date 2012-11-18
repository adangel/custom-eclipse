# Branded Eclipse Example

Build an own, branded eclipse with a couple of plugins already installed an selected.

## How-To

1. Review create-mirror.sh and comment/uncomment the update sites you want to mirror
2. Execute create-mirror.sh
3. Drink coffee. This can take a while. If every update site is enabled, you'll download about 5 gigabytes.
4. Have a look at "branding". This is a eclipse plugin which brings
    * A splash screen. Replace "splash.bmp" with your own.
    * Icons. Replace icon*.* with your own.
    * About dialog in eclipse. See plugin.xml/plugin.properties for details. See also about.gif for the logo
      in the about dialog.
5. Have a look at "feature/feature.xml". This selects hopefully all the features, that come with the default
Eclipse JEE bundle. You can add/remove features and plugins.
6. Have a look at "feature-plugins/feature.xml". This select all additional features/plugins from external sites
that have been mirrored.
7. Have a look at the top-level pom.xml file. You can specify for which platforms you want to create an
own eclipse distribution. See the plugin "target-platform-configuration" and the environments configuration.
8. In the same top-level pom.xml file, update the repository path to your own mirror.
9. Execute "mvn clean package". The result is stored under "distribution/target/products/".


## References

* Eclipse Magazin (http://www.eclipse-magazin.de), Issue 5.12, Page 52
* http://wiki.eclipse.org/Tycho/Demo_Projects/RCP_Application
* https://github.com/rombert/scripts/blob/master/bin/mirror_eclipse_update_site.sh
* http://wiki.eclipse.org/Equinox_p2_Repository_Mirroring
* http://stackoverflow.com/questions/1371176/downloading-eclipse-plug-in-update-sites-for-offline-installation
* http://wiki.eclipse.org/Equinox/p2/Publisher#Features_And_Bundles_Publisher_Application


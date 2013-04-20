#!/bin/bash

#
# Configuration:
#
# Base path to an eclipse installation. Note: This needs to be a prior 4.2 version! E.g. 3.7/indigo
eclipse_home=$HOME/Programs/eclipse-3.7.1-jee-indigo-SR1
# Local directory for downloads (see download_convert*() and svn_site_checkout())
downloads=./downloads/
# Local directory for the old-style update site mirror
site_mirror=./mirror-sites/
# Local p2 repo
target_p2=file://$HOME/mirror-eclipse-p2/

#
# Mirrors an old-style update site (not a p2 repository)
# Can mirror multiple sites into one mirror. The sites are merged.
#
# $1 - Source URL of the update site like you would enter it in Eclipse
#
function mirror_site()
{
java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar \
    -application org.eclipse.update.core.standaloneUpdate \
    -command mirror -from $1 -to $site_mirror -ignoreMissingPlugins true
}

#
# Converts are mirror of old-style update sites into a p2 repository.
# Usually called once for multiple mirror_site() calls.
# If called for an existing, non-empty local p2 repo, then the additional
# artifacts are merged into it.
#
function convert_site()
{
java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar \
   -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
   -metadataRepository $target_p2 \
   -artifactRepository $target_p2 \
   -source $site_mirror \
   -append \
   -publishArtifacts
}

#
# Mirrors a p2 repository into a local directory.
# Can be called multiple times. All repos are merged into the local directory.
#
# $1 - Source URL of the update site like you would enter it in Eclipse
#
function mirror_p2()
{
echo -n "Mirroring P2 Repo: $1..."
java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar \
    -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication \
    -source $1 -destination $target_p2
java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar \
    -application org.eclipse.equinox.p2.metadata.repository.mirrorApplication \
    -source $1 -destination $target_p2
echo "done."
}

#
# Downloads a zip file containing a eclipse plugin and adds this plugin
# to the local p2 repo.
# Note: The zip file must contain either a copy of the update site (e.g. site.xml)
# or at least a plugins/ subdirectory so that it is recognized.
#
# $1 - some unique symbolic name of the plugin. Needed, so that download_convert() can
#      be called multiple times for different plugins without interferring each other.
# $2 - download URL, suitable for wget
#
function download_convert()
{
if [ ! -e $downloads ]; then
    mkdir $downloads
fi

mkdir $downloads/$1
file="$downloads/"`basename $2`

wget -O $file $2
unzip -d $downloads/$1 $file

java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar \
   -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
   -metadataRepository $target_p2 \
   -artifactRepository $target_p2 \
   -source $downloads/$1 \
   -append \
   -publishArtifacts
}

#
# Downloads a zip file containing a eclipse plugin and adds this plugin
# to the local p2 repo.
# Note: This time, the zip file contains directly the plugin and not
# a update site structure. Therefore a "plugins/" subdirectory is created.
#
# $1 - some unique symbolic name of the plugin. Needed, so that download_convert() can
#      be called multiple times for different plugins without interferring each other.
# $2 - download URL, suitable for wget
#
function download_convert_plugins()
{
if [ ! -e $downloads ]; then
    mkdir $downloads
fi

mkdir -p $downloads/$1/plugins
file="$downloads/"`basename $2`

wget -O $file $2
unzip -d $downloads/$1/plugins $file

java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar \
   -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
   -metadataRepository $target_p2 \
   -artifactRepository $target_p2 \
   -source $downloads/$1/ \
   -append \
   -publishArtifacts
}

#
# Does an svn checkout of a subversion repository, which contains a ready to use
# update site. Then adds this update site to the local p2 repo.
#
# $1 - some unique symbolic name of the plugin. Needed, so that svn_site_checkout() can
#      be called multiple times for different plugins without interferring each other.
# $2 - the svn repo url
#
function svn_site_checkout()
{
if [ ! -e $downloads ]; then
    mkdir $downloads
fi

mkdir $downloads/$1
svn checkout $2 $downloads/$1

java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar \
   -application org.eclipse.equinox.p2.publisher.FeaturesAndBundlesPublisher \
   -metadataRepository $target_p2 \
   -artifactRepository $target_p2 \
   -source $downloads/$1 \
   -append \
   -publishArtifacts

}


#mirror_site "http://findbugs.cs.umd.edu/eclipse/"
#mirror_site "http://www.soyatec.com/update/juno/"
#mirror_site "http://www.soyatec.com/update/indigo/"
#mirror_site "http://www.soyatec.com/update/"
#mirror_site "http://www.jutils.com/eclipse-update/"
#mirror_site "http://andrei.gmxhome.de/eclipse/"
#mirror_site "http://download.aptana.com/studio3/plugin/install"
#mirror_site "http://update.atlassian.com/atlassian-eclipse-plugin/e3.8/"
#mirror_site "http://jautodoc.sourceforge.net/update/"
#mirror_site "http://www.junginger.biz/eclipse/"
#mirror_site "http://update.atlassian.com/eclipse/clover/"
#mirror_site "http://jadclipse.sourceforge.net/update/"
#mirror_site "http://pydev.org/updates/"
#mirror_site "http://pluginbox.sourceforge.net/"
#convert_site

#
# http://wiki.eclipse.org/Simultaneous_Release
#
#mirror_p2 "http://download.eclipse.org/releases/juno"
#mirror_p2 "http://download.eclipse.org/mylyn/releases/juno"
#mirror_p2 "http://download.eclipse.org/eclipse/updates/4.2"
#mirror_p2 "http://download.eclipse.org/webtools/repository/juno"
#mirror_p2 "http://eclipse-cs.sourceforge.net/update"
#mirror_p2 "http://dist.springsource.com/release/TOOLS/update/e4.2"
#mirror_p2 "http://download.eclipse.org/technology/m2e/releases"
#mirror_p2 "http://update.eclemma.org/"
#mirror_p2 "http://sourceforge.net/projects/pmd/files/pmd-eclipse/update-site/"
#mirror_p2 "http://download.eclipse.org/egit/updates"
#mirror_p2 "http://subclipse.tigris.org/update_1.8.x/"
#mirror_p2 "http://download.jboss.org/jbosstools/updates/stable/juno/"

#
# http://m2e-code-quality.github.com/m2e-code-quality/
#
#mirror_p2 "http://m2e-code-quality.github.com/m2e-code-quality/site/1.0.0"
#

#
# org.sonatype.m2e. m2e connectors
# see also: http://repo1.maven.org/maven2/.m2e/discovery-catalog/connectors.xml
#
#mirror_p2 "http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-buildhelper/0.15.0/N/0.15.0.201212120353/"
#mirror_p2 "http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-mavenarchiver/0.15.0/N/0.15.0.201212080009/"
#mirror_p2 "http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-modello/0.16.0/N/0.16.0.201302171621/"
#mirror_p2 "http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-modello/0.15.0/N/0.15.0.201207090125/"
#mirror_p2 "http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-plexus/0.15.0/N/0.15.0.201302101151/"
#mirror_p2 "http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-tycho/0.6.0/N/0.6.0.201210231015/"
#mirror_p2 "http://repo1.maven.org/maven2/.m2e/connectors/m2eclipse-tycho/0.7.0/N/0.7.0.201302171659/"
#mirror_p2 "http://dist.springsource.org/release/AJDT/composite/"
#mirror_p2 "http://download.jboss.org/jbosstools/updates/m2e-extensions/m2e-jdt-compiler/"
#mirror_p2 "http://download.jboss.org/jbosstools/updates/m2e-extensions/m2e-jdt-compiler/1.0.1-2012-09-20_05-03-18-H2/"
#mirror_p2 "http://download.eclipse.org/m2e-wtp/releases/"


#download_convert "rbe" "http://sourceforge.net/projects/eclipse-rbe/files/Eclipse%203.x/0.8.0/ResourceBundleEditor_v0.8.0.zip"
#download_convert_plugins "jutils" "http://sourceforge.net/projects/eclipse-jutils/files/eclipse-jutils/eclipse-jutils%20plugin%20v3.1/org.adarsh.jutils_3.1.0.zip"
#download_convert "json" "http://sourceforge.net/projects/eclipsejsonedit/files/eclipsejsonedit/Json%20Editor%20Plugin%200.9.4/JsonEditorPlugin-0.9.4.zip"

#svn_site_checkout "jenkins" "http://jenkins-eclipse-plugin.googlecode.com/svn/trunk/jenkins-update/"
#svn_site_checkout "grinderstone" "http://grinderstone.googlecode.com/svn/update/"

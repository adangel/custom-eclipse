#!/bin/bash


#####################
# Preparation
#####################
mkdir -p temp

# Download eclipse 3.7. Note: This needs to be prior 4.2 version, e.g. 3.7 indigo, as the later
# versions don't have the code for accessing old update sites.
eclipse_archive=temp/eclipse-SDK-3.7.2-linux-gtk-x86_64.tar.gz
if [ ! -e $eclipse_archive ]; then
    wget -O $eclipse_archive http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops/R-3.7.2-201202080800/eclipse-SDK-3.7.2-linux-gtk-x86_64.tar.gz
fi

eclipse_home=temp/eclipse-3.7.2
if [ ! -d $eclipse_home ]; then
   ( cd temp; tar xfzv ../$eclipse_archive; mv eclipse ../$eclipse_home )
fi

# Local directory for downloads (see download_convert*() and svn_site_checkout())
downloads=temp/downloads
# Local directory for the old-style update site mirror
site_mirror=temp/mirror-sites
# Local p2 repo
target_p2=file://`pwd`/temp/p2-mirror/

. functions.sh


#####################################
# Downloads/Mirrors
#####################################



mirror_site "http://findbugs.cs.umd.edu/eclipse/"

# euml2
#mirror_site "http://www.soyatec.com/update/juno/"
#mirror_site "http://www.soyatec.com/update/indigo/"
#mirror_site "http://www.soyatec.com/update/"

mirror_site "http://www.jutils.com/eclipse-update/"
mirror_site "http://andrei.gmxhome.de/eclipse/"
mirror_site "http://jautodoc.sourceforge.net/update/"
mirror_site "http://www.junginger.biz/eclipse/"

#
# https://confluence.atlassian.com/display/CLOVER/Clover-for-Eclipse+Installation+Guide
#
#mirror_site "https://update.atlassian.com/eclipse/clover/"

mirror_site "http://jadclipse.sourceforge.net/update/"
mirror_site "http://pluginbox.sourceforge.net/"

#
# http://svnkit.com/download.php
#mirror_site "http://eclipse.svnkit.com/1.8.x/"
#convert_site
#Due to http://issues.tmatesoft.com/issue/SVNKIT-555 an older version is required
#download_convert "svnkit1.8.5" "http://www.svnkit.com/org.tmatesoft.svn_1.8.5.eclipse.zip"

#
# http://wiki.eclipse.org/Simultaneous_Release
#
# mars
mirror_p2 "http://download.eclipse.org/releases/mars/"
mirror_p2 "http://download.eclipse.org/mylyn/releases/latest"

# other plugins
#
# http://www.eclipse.org/recommenders/
#
mirror_p2 "http://download.eclipse.org/recommenders/updates/stable/"
mirror_p2 "http://eclipse-cs.sourceforge.net/update"
# http://spring.io/tools
mirror_p2 "http://dist.springsource.com/release/TOOLS/update/e4.5"
mirror_p2 "http://download.eclipse.org/technology/m2e/releases"
mirror_p2 "http://update.eclemma.org/"
mirror_p2 "https://sourceforge.net/projects/pmd/files/pmd-eclipse/update-site/"
mirror_p2 "http://download.eclipse.org/egit/updates"
#mirror_p2 "http://subclipse.tigris.org/update_1.10.x"
# http://tools.jboss.org/downloads/jbosstools/luna/
mirror_p2 "http://download.jboss.org/jbosstools/updates/stable/luna/"
#mirror_p2 "http://download.jboss.org/jbosstools/updates/development/luna/"

#
# http://m2e-code-quality.github.com/m2e-code-quality/
# --> https://github.com/m2e-code-quality/m2e-code-quality/tree/gh-pages/site/latest
mirror_p2 "http://m2e-code-quality.github.io/m2e-code-quality/site/latest/"
#

#
# org.sonatype.m2e. m2e connectors
# see also: http://repo.maven.apache.org/maven2/.m2e/discovery-catalog/connectors.xml
#
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-buildhelper/0.15.0/N/0.15.0.201405280027/"
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-mavenarchiver/0.17.0/N/LATEST/"
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-modello/0.16.0/N/LATEST/"
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-plexus/0.15.0/N/LATEST/"
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-tycho/0.9.0/N/LATEST/"
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-antlr/0.15.0/N/0.15.0.201405281449/"
mirror_p2 "http://dist.springsource.org/release/AJDT/composite/"
mirror_p2 "http://download.jboss.org/jbosstools/updates/m2e-extensions/m2e-jdt-compiler/"
mirror_p2 "http://download.jboss.org/jbosstools/updates/m2e-extensions/m2e-jdt-compiler/1.0.1-2012-09-20_05-03-18-H2/"
mirror_p2 "http://download.eclipse.org/m2e-wtp/releases/"

#
# m2e connector for jaxb
# see http://bitstrings.github.io/
#
mirror_p2 "http://bitstrings.github.io/m2e-connectors-p2/releases/"

#
# m2e connector for maven-antrun-plugin
# see http://code.google.com/p/nl-mwensveen-m2e-extras/
#
mirror_p2 "http://nl-mwensveen-m2e-extras.googlecode.com/svn/trunk/p2"

#
# testng plugin
# see http://testng.org/doc/eclipse.html
#
#mirror_p2 "http://beust.com/eclipse"
# the p2 metadata doesn't seem to have the latest version, so mirror_site is needed
mirror_site "http://beust.com/eclipse"
convert_site


#
# Doxia editor for eclipse
# see http://maven.apache.org/doxia/doxia-ide/eclipse/
#
mirror_p2 "http://maven.apache.org/doxia/doxia-ide/eclipse/eclipse/"

#
# Markdown Editor
# http://www.winterwell.com/software/markdown-editor.php
# https://github.com/winterstein/Eclipse-Markdown-Editor-Plugin
#
mirror_p2 "http://www.winterwell.com/software/updatesite/"

#
# http://www.aptana.com/products/studio3/download
#
mirror_p2 "http://download.aptana.com/studio3/plugin/install"
# dev-versions of aptana studio
#mirror_p2 "http://studio-jenkins.appcelerator.org/job/studio3-feature-development/lastSuccessfulBuild/artifact/dist/"

#
# Python IDE: http://pydev.org/
#
#mirror_p2 "http://pydev.org/updates/"

#mirror_p2 "http://jenkins-eclipse-plugin.googlecode.com/svn/trunk/jenkins-update/"


#
# http://www.eclipse.org/rap/
#
#mirror_p2 "http://download.eclipse.org/rt/rap/tools/2.1/"

#
# Eclipse Resource Bundle Editor
# http://essiembre.github.io/eclipse-rbe/
# https://github.com/essiembre/eclipse-rbe
#
mirror_p2 "https://raw.githubusercontent.com/essiembre/eclipse-rbe/master/eclipse-rbe-update-site/"

#
# Eclipse Fonts
#
# https://code.google.com/p/eclipse-fonts/
#
# Note: seems not to be a correct p2 repo (missing artifacts): #mirror_p2 "http://eclipse-fonts.googlecode.com/svn/trunk/FontsUpdate/"
mirror_site "http://eclipse-fonts.googlecode.com/svn/trunk/FontsUpdate/"
convert_site

#
# Cucumber/Gherkin Editor
# http://cukes.info/cucumber-eclipse/
#
# Note: seems not to be a correct p2 repo (missing artifacts): #mirror_p2 "http://cucumber.github.com/cucumber-eclipse/update-site/"
mirror_site "http://cucumber.github.com/cucumber-eclipse/update-site/"
convert_site


download_convert_plugins "jutils" "http://sourceforge.net/projects/eclipse-jutils/files/eclipse-jutils/eclipse-jutils%20plugin%20v3.1/org.adarsh.jutils_3.1.0.zip"
download_convert "json" "http://sourceforge.net/projects/eclipsejsonedit/files/eclipsejsonedit/Json%20Editor%20Plugin%200.9.7/jsonedit-repository-0.9.7.zip"

#svn_site_checkout "grinderstone" "http://grinderstone.googlecode.com/svn/update/"

#
# https://github.com/weightpoint/jslint-eclipse
#
mirror_p2 "http://weightpoint.github.io/jslint-eclipse/updates/"

#
# https://code.google.com/p/apt-m2e/
# APT-Connector for M2E
#
mirror_p2 "http://apt-m2e.googlecode.com/git/updateSite/"

#
# Optimizer for Eclipse
# http://zeroturnaround.com/free/optimizer-for-eclipse/
#
mirror_p2 "http://update.zeroturnaround.com/free-tools/site/"

#
# Eclipse Subversive - Subversion (SVN) Team Provider
# http://eclipse.org/subversive/
#
mirror_p2 "http://download.eclipse.org/technology/subversive/2.0/update-site/"
mirror_p2 "http://download.eclipse.org/technology/subversive/3.0/update-site/"

#
# Download Subversive Subversion Team Provider for Eclipse - the connectors
# http://www.polarion.com/products/svn/subversive/download.php
#
mirror_p2 "http://community.polarion.com/projects/subversive/download/eclipse/4.0/mars-site"

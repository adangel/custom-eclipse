#!/bin/bash


. prepare.sh
. functions.sh


#####################################
# Downloads/Mirrors
#####################################

#
# Basic repository for the Eclipse release.
# See: http://wiki.eclipse.org/Simultaneous_Release
# Features see http://git.eclipse.org/c/epp/org.eclipse.epp.packages.git/tree/packages
#
mirror_p2 "http://download.eclipse.org/releases/neon/"

#
# Updates for the Eclipse release
#
mirror_p2 "http://download.eclipse.org/eclipse/updates/4.6"

#
# Papyrus Software Designer
# See: http://wiki.eclipse.org/Papyrus_Software_Designer
# See: http://wiki.eclipse.org/Java_reverse_engineering
#
mirror_p2 "http://download.eclipse.org/modeling/mdt/papyrus/components/designer/"

#
# Mylyn is the task and application lifecycle management (ALM) framework for Eclipse.
# See: https://www.eclipse.org/mylyn/
# Features:
# org.eclipse.mylyn_feature
# org.eclipse.mylyn.bugzilla_feature
# org.eclipse.mylyn.context_feature
# org.eclipse.mylyn.gerrit.feature
# org.eclipse.mylyn.git
# org.eclipse.mylyn.github.feature
# org.eclipse.mylyn.hudson
# org.eclipse.mylyn.ide_feature
# org.eclipse.mylyn.java_feature
# org.eclipse.mylyn.monitor
# org.eclipse.mylyn.pde_feature
# org.eclipse.mylyn.reviews.feature
# org.eclipse.mylyn.subclipse
# org.eclipse.mylyn.tasks.ide
# org.eclipse.mylyn.team_feature
# org.eclipse.mylyn.wikitext_feature
# org.eclipse.mylyn.docs.epub
#
mirror_p2 "http://download.eclipse.org/mylyn/releases/latest"

#
# FindBugs - Find Bugs in Java Programs
# See: http://findbugs.sourceforge.net/
# See: https://marketplace.eclipse.org/content/findbugs-eclipse-plugin
# Feature: edu.umd.cs.findbugs.plugin.eclipse
#
mirror_p2 "http://findbugs.cs.umd.edu/eclipse/"

#
# Checkstyle: Checkstyle is a development tool to help programmers write Java code that adheres to a coding standard
# See: http://checkstyle.sourceforge.net/
# See: https://marketplace.eclipse.org/content/checkstyle-plug
# Feature: net.sf.eclipsecs
#
mirror_p2 "http://eclipse-cs.sourceforge.net/update"

#
# PMD: PMD is a source code analyzer. It finds common programming flaws like unused variables,
# empty catch blocks, unnecessary object creation, and so forth.
# See: http://pmd.github.io/
# See: https://marketplace.eclipse.org/content/pmd-eclipse-plugin
# Feature: net.sourceforge.pmd.eclipse
#
mirror_p2 "https://sourceforge.net/projects/pmd/files/pmd-eclipse/update-site/"

#
# PMD: PMD is a source code analyzer. It finds common programming flaws like unused variables,
# empty catch blocks, unnecessary object creation, and so forth.
# See: http://pmd.github.io/
# This is the alternative PMD plugin
# See: http://acanda.github.io/eclipse-pmd/
# See: https://marketplace.eclipse.org/content/eclipse-pmd
# Feature: ch.acanda.eclipse.pmd.java.feature
#
mirror_p2 "http://www.acanda.ch/eclipse-pmd/release/latest"

#
# EclEmma Java Code Coverage
# See: http://eclemma.org/
# See: https://marketplace.eclipse.org/content/eclemma-java-code-coverage
# Feature: com.mountainminds.eclemma.feature
#
mirror_p2 "http://update.eclemma.org/"


#
# M2Eclipse provides tight integration for Apache Maven into the IDE
# See: https://www.eclipse.org/m2e/
# Features:
# org.eclipse.m2e.feature
# org.eclipse.m2e.logback.feature
#
mirror_p2 "http://download.eclipse.org/technology/m2e/releases"

#
# m2e-code-quality
# See: http://m2e-code-quality.github.io/m2e-code-quality/
# See: https://marketplace.eclipse.org/content/m2e-code-quality
# Features:
# com.basistech.m2e.code.quality.checkstyle.feature
# com.basistech.m2e.code.quality.findbugs.feature
# com.basistech.m2e.code.quality.pmd.feature
#
mirror_p2 "http://m2e-code-quality.github.io/m2e-code-quality/site/latest/"

#
# org.sonatype.m2e. m2e connectors
# see also: http://repo.maven.apache.org/maven2/.m2e/discovery-catalog/connectors.xml
#

# org.sonatype.m2e.buildhelper.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-buildhelper/0.15.0/N/0.15.0.201405280027/"

# org.sonatype.m2e.mavenarchiver.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-mavenarchiver/0.17.2/N/LATEST/"

# org.sonatype.m2e.modello.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-modello/0.16.0/N/LATEST/"

# org.sonatype.m2e.plexus.annotations.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-plexus/0.15.0/N/LATEST/"

# org.sonatype.tycho.m2e.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-tycho/0.9.0/N/LATEST/"

# org.sonatype.m2e.antlr.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-antlr/0.15.0/N/0.15.0.201405281449/"

# org.sonatype.m2e.sisu.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-sisu/0.15.0/N/LATEST/"

# org.sonatype.m2e.egit.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-egit/0.15.0/N/LATEST/"

# org.sonatype.m2e.subversive.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-subversive/0.13.0/N/0.13.0.201302121311/"

# org.sonatype.m2e.subclipse.feature
mirror_p2 "http://repo.maven.apache.org/maven2/.m2e/connectors/m2eclipse-subclipse/0.13.0/N/0.13.0.201303011221/"


#
# Maven Integration for WTP
# See: https://www.eclipse.org/m2e-wtp/
# Features:
# org.eclipse.m2e.wtp.feature
# org.eclipse.m2e.wtp.jaxrs.feature
# org.eclipse.m2e.wtp.jpa.feature
# org.eclipse.m2e.wtp.jsf.feature
mirror_p2 "http://download.eclipse.org/m2e-wtp/releases/"

#
# JBoss Tools: Eclipse Plugins for JBoss Technology 
# See: http://tools.jboss.org/
# See: https://marketplace.eclipse.org/content/jboss-tools
# Features: see also http://download.jboss.org/jbosstools/static/mars/stable/updates/core/4.3.0.Final/
# org.jboss.ide.eclipse.freemarker.feature
# org.jboss.tools.common.jdt.feature
# org.jboss.tools.jmx.feature
# org.jboss.tools.jsf.feature
# org.jboss.tools.jst.angularjs.feature
# org.jboss.tools.jst.feature
# org.jboss.tools.jst.jsdt.feature
# org.jboss.tools.livereload.feature
# org.jboss.tools.maven.apt.feature
# org.jboss.tools.maven.cdi.feature
# org.jboss.tools.maven.feature
# org.jboss.tools.maven.hibernate.feature
# org.jboss.tools.maven.jbosspackaging.feature
# org.jboss.tools.maven.jdt.feature
# org.jboss.tools.maven.portlet.feature
# org.jboss.tools.maven.sourcelookup.feature
# org.jboss.tools.websockets.feature
# org.jboss.tools.ws.feature
# org.jboss.tools.ws.jaxrs.feature
# org.jboss.tools.wtp.runtimes.tomcat.feature
# org.jboss.tools.wtp.server.launchbar.feature
# org.jboss.tools.xulrunner.feature
#
mirror_p2 "http://download.jboss.org/jbosstools/neon/stable/updates/"


#
# Spring Tool Suite (STS) for Eclipse
# See: https://spring.io/tools/sts/all
# See: http://marketplace.eclipse.org/content/spring-tool-suite-sts-eclipse
# Features:
# org.springframework.ide.eclipse.ajdt.feature
# org.springframework.ide.eclipse.aop.feature
# org.springframework.ide.eclipse.autowire.feature
# org.springframework.ide.eclipse.batch.feature
# org.springframework.ide.eclipse.boot.dash.feature
# org.springframework.ide.eclipse.data.feature
# org.springframework.ide.eclipse.feature
# org.springframework.ide.eclipse.integration.feature
# org.springframework.ide.eclipse.maven.feature
# org.springframework.ide.eclipse.mylyn.feature
# org.springframework.ide.eclipse.osgi.feature
# org.springframework.ide.eclipse.roo.feature
# org.springframework.ide.eclipse.security.feature
# org.springframework.ide.eclipse.webflow.feature
# org.springsource.ide.eclipse.commons.quicksearch.feature
# org.springsource.ide.eclipse.commons
# org.springsource.ide.eclipse.dashboard
# org.springsource.ide.eclipse.gradle.feature
# org.springsource.sts.package
# org.springsource.sts
#
mirror_p2 "http://dist.springsource.com/release/TOOLS/update/e4.6/"

#
# Groovy/Grails Tool Suite (GGTS) for Eclipse
# See: https://spring.io/tools/ggts/
# See: https://marketplace.eclipse.org/content/groovygrails-tool-suite-ggts-eclipse
# Features:
# org.codehaus.groovy24.feature
# org.codehaus.groovy.compilerless.feature
# org.codehaus.groovy.eclipse.feature
# org.codehaus.groovy.jdt.patch
# org.codehaus.groovy.m2eclipse.feature
#
mirror_p2 "http://dist.springsource.com/release/TOOLS/update/e4.5/"

#
# Maven project configuration for Eclipse AJDT
# See: ?
# Features:
# org.maven.ide.eclipse.ajdt.feature
#
mirror_p2 "http://dist.springsource.org/release/AJDT/configurator-v2/"


#
# AspectJ Development Tools Project
# See: https://www.eclipse.org/ajdt/
# Features:
# org.eclipse.ajdt
#
mirror_p2 "http://download.eclipse.org/tools/ajdt/46/dev/update/"

#
# basepom: All the base POMs in the world.
# See: https://github.com/basepom/basepom
# Features:
# org.basepom.m2e.duplicate_finder.feature
# org.basepom.m2e.property_helper.feature
# org.basepom.m2e.mycila_license.feature
# org.basepom.m2e.ning_dependency_versions_check.feature
# org.basepom.m2e.ning_duplicate_finder.feature
# org.basepom.m2e.apache_axis2_wsdl2code.feature
#
mirror_p2 "http://basepom.github.io/basepom-m2e/update-site/latest/"


#
# m2e connector for the Maven Dependency Plugin
# See: https://github.com/ianbrandt/m2e-maven-dependency-plugin/blob/master/README.md
# Features:
# com.ianbrandt.tools.m2e.mdp.feature
#
mirror_p2 "http://ianbrandt.github.io/m2e-maven-dependency-plugin/"

#
# Maven Development Tools
# See: https://github.com/ifedorenko/com.ifedorenko.m2e.mavendev
# Features:
# com.ifedorenko.m2e.mavendev.feature
# com.ifedorenko.m2e.sourcelookup.feature
# io.takari.stats.m2e.feature
#
mirror_p2 "http://ifedorenko.github.com/m2e-extras/"


# m2e-connector for jaxws-maven-plugin
# See: https://marketplace.eclipse.org/content/m2e-connector-jaxws-maven-plugin
# See: https://github.com/coderplus/m2e-connector-for-jaxws-maven-plugin
# Features:
# com.coderplus.m2e.jaxws
#
mirror_p2 "http://coderplus.com/m2e-update-sites/jaxws-maven-plugin/"

#
# m2e-connector for maven-remote-resources-plugin
# See: https://marketplace.eclipse.org/content/m2e-connector-maven-remote-resources-plugin
# See: https://github.com/coderplus/m2e-connector-for-maven-remote-resources-plugin
# Features:
# com.coderplus.m2e.remoteresourcesfeature
#
mirror_p2 "http://coderplus.com/m2e-update-sites/maven-remote-resources-plugin/"

# m2e-connector for yuicompressor-maven-plugin
# See: https://marketplace.eclipse.org/content/m2e-connector-yuicompressor-maven-plugin
# See: https://github.com/coderplus/m2e-connector-yuicompressor-maven-plugin
# Features:
# com.coderplus.m2e.yuicompressorfeature
#
mirror_p2 "http://coderplus.com/m2e-update-sites/yuicompressor-maven-plugin/"

#
# m2e connector for jaxb
# See: http://bitstrings.github.io/
# See: https://github.com/bitstrings/m2e-connectors
# Features:
# org.bitstrings.eclipse.m2e.connectors.dependencypath.feature
# org.bitstrings.eclipse.m2e.connectors.jaxb2.feature
# org.bitstrings.eclipse.m2e.connectors.xmlbeans.feature
#
mirror_p2 "http://bitstrings.github.io/m2e-connectors-p2/releases/"

#
# m2e connector for maven-antrun-plugin
# See: https://github.com/mwensveen-nl/nl-mwensveen-m2e-extras/wiki
# See: https://github.com/mwensveen-nl/nl-mwensveen-m2e-extras
# Features:
# nl.mwensveen.m2e.extras.antrun.feature
# nl.mwensveen.m2e.extras.cxf.wsdl2java.feature
# nl.mwensveen.m2e.extras.cxf.xsdtojava.feature
# nl.mwensveen.m2e.extras.java.formatter.feature
# nl.mwensveen.m2e.extras.xml.transform.feature
#
mirror_p2 "http://mwensveen-nl.github.io/nl-mwensveen-m2e-extras/"

#
# JAutodoc - Eclipse Plugin
# See: http://jautodoc.sourceforge.net/
# Features:
# net.sf.jautodoc.feature
#
mirror_p2 "http://jautodoc.sourceforge.net/update/"

#
# Optimizer for Eclipse
# See: http://zeroturnaround.com/free/optimizer-for-eclipse/
# See: http://marketplace.eclipse.org/content/optimizer-eclipse
# Features:
# com.zeroturnaround.eclipse.optimizer.feature
#
mirror_p2 "http://update.zeroturnaround.com/free-tools/site/"



#
# EGit - Eclipse Team provider for the Git
# See: https://www.eclipse.org/egit/
# See: http://marketplace.eclipse.org/content/egit-git-team-provider
# Features:
# org.eclipse.egit
# org.eclipse.egit.mylyn
# org.eclipse.egit.gitflow.feature
# org.eclipse.jgit
# org.eclipse.jgit.pgm
#
mirror_p2 "http://download.eclipse.org/egit/updates"

#
# Code Recommenders - The Intelligent Development Environment
# See: http://www.eclipse.org/recommenders/
# See: http://marketplace.eclipse.org/content/eclipse-code-recommenders
# Features:
# org.eclipse.recommenders.feature.rcp
# org.eclipse.recommenders.mylyn.rcp.feature
# org.eclipse.recommenders.rcp.feature
# org.eclipse.recommenders.snipmatch.rcp.feature
#
mirror_p2 "http://download.eclipse.org/recommenders/updates/stable/"

#
# TestNG Eclipse plug-in
# See: http://testng.org/doc/eclipse.html
# See: http://marketplace.eclipse.org/content/testng-eclipse
# Features:
# org.testng.eclipse
#
mirror_p2 "http://beust.com/eclipse"

#
# Apache Doxia Eclipse Editor Plugin
# See: http://maven.apache.org/doxia/doxia-ide/eclipse/
# Features:
# org.apache.maven.doxia.ide.eclipse.feature
#
mirror_p2 "http://maven.apache.org/doxia/doxia-ide/eclipse/eclipse/"

#
# Aptana Studio
# See: http://www.aptana.com/products/studio3/download
# dev-versions: 
# mirror_p2 "http://studio-jenkins.appcelerator.org/job/studio3-feature-development/lastSuccessfulBuild/artifact/dist/"
# Features:
# com.aptana.feature.studio
# com.aptana.feature
# com.aptana.ide.feature.libraries.subscription
# com.aptana.php.feature
# com.aptana.pydev.feature
# org.radrails.rails
#
mirror_p2 "http://download.aptana.com/studio3/plugin/install"

#
# Eclipse Resource Bundle Editor
# See: http://essiembre.github.io/eclipse-rbe/
# See: https://github.com/essiembre/eclipse-rbe
# Features:
# com.essiembre.eclipse.rbe
#
mirror_p2 "https://raw.githubusercontent.com/essiembre/eclipse-rbe/master/eclipse-rbe-update-site/"

#
# Eclipse Subversive - Subversion (SVN) Team Provider
# See: http://eclipse.org/subversive/
# See: http://marketplace.eclipse.org/content/subversive-svn-team-provider
# Features:
# org.eclipse.team.svn.m2e
# org.eclipse.team.svn.mylyn
# org.eclipse.team.svn.nl1
# org.eclipse.team.svn.resource.ignore.rules.jdt
# org.eclipse.team.svn.revision.graph
# org.eclipse.team.svn
#
mirror_p2 "http://download.eclipse.org/technology/subversive/4.0/update-site/"

#
# Download Subversive Subversion Team Provider for Eclipse - the connectors
# See: http://www.polarion.com/products/svn/subversive/download.php
# Features:
# org.polarion.eclipse.team.svn.connector.javahl17.win32
# org.polarion.eclipse.team.svn.connector.javahl17.win64
# org.polarion.eclipse.team.svn.connector.javahl17
# org.polarion.eclipse.team.svn.connector.javahl18.win32
# org.polarion.eclipse.team.svn.connector.javahl18.win64
# org.polarion.eclipse.team.svn.connector.javahl18
# org.polarion.eclipse.team.svn.connector.svnkit17
# org.polarion.eclipse.team.svn.connector.svnkit18
# org.polarion.eclipse.team.svn.connector
#
mirror_p2 "http://community.polarion.com/projects/subversive/download/eclipse/6.0/update-site/"

#
# Python IDE - PyDev
# See: http://pydev.org/
# Features:
# org.python.pydev.feature
# org.python.pydev.mylyn.feature
#
mirror_p2 "http://www.pydev.org/updates/"

#
# JSLint integration for the Eclipse IDE
# See: https://github.com/weightpoint/jslint-eclipse
# Features:
# se.weightpoint.jslint.feature
#
mirror_p2 "http://weightpoint.github.io/jslint-eclipse/updates/"

#
# DocBook Editing and Processing for Eclipse (DEP4E)
# See: http://dep4e.sourceforge.net/
# Features:
# net.sourceforge.dep4e.feature
#
mirror_p2 "https://sourceforge.net/projects/dep4e/files/repository/"






#
# Lint4j ("Lint for Java")
# See: http://www.jutils.com/
# Features:
# com.jutils.lint4j.core
#
mirror_site "http://www.jutils.com/eclipse-update/"
convert_site

#
# Various Eclipse Plugins
# See: http://andrei.gmxhome.de/eclipse.html
# See: http://andrei.gmxhome.de/jdepend4eclipse/index.html
# Features:
# JDepend4Eclipse
# FileSync
# AnyEditTools
# org.eclipselabs.plugindependencies
# EclipseSkins
# DataHierarchy
# de.loskutov.BytecodeOutline.feature
# zipeditor
#
mirror_site "http://andrei.gmxhome.de/eclipse/"
convert_site

#
# Various Eclipse Plugins
# See: http://www.junginger.biz/eclipse/
# Features:
# biz.junginger.FreeMemFeature
# biz.junginger.RssViewFeature
# biz.junginger.ExploreFS_Feature
#
mirror_site "http://www.junginger.biz/eclipse/"
convert_site

#
# Java Decompiler - Yet another fast Java decompiler
# See: http://jd.benow.ca/
# See: https://github.com/java-decompiler/jd-eclipse
# See: https://mchr3k.github.io/jdeclipse-realign/
# Features:
# jd.edi.eclipse.feature
# realignment.jd.ide.eclipse.feature
# codetrails.feature
#
mirror_site "http://mchr3k-eclipse.appspot.com/"
convert_site

#
# Cucumber/Gherkin Editor
# See: https://cucumber.io/cucumber-eclipse/
# Features:
# cucumber.eclipse.feature
#
# mirror_p2 "http://cucumber.github.com/cucumber-eclipse/update-site"
# note: the p2 repo doesn't have the latest version 
mirror_site "http://cucumber.github.com/cucumber-eclipse/update-site"
convert_site

#
# YEdit is an Eclipse editor for editing YAML files.
# See: https://marketplace.eclipse.org/content/yedit
# See: https://github.com/oyse/yedit
# Features:
# org.dadacoalition.yedit.feature
#
mirror_p2 "http://dadacoalition.org/yedit/"

#
# Protobuf-dt is a new Eclipse plug-in for editing protocol buffer descriptor files.
# See: https://marketplace.eclipse.org/content/protobuf-dt
# See: https://github.com/google/protobuf-dt
# Features:
# com.google.eclipse.protobuf
#
mirror_p2 "http://google.github.io/protobuf-dt/updates/latest/"

#
# PDT: Eclipse PHP Development Tools
# See: http://www.eclipse.org/pdt/
# Features:
# org.eclipse.php
# org.eclipse.php.composer
# org.eclipse.php.mylyn
# org.eclipse.php.importer
#
mirror_p2 "http://download.eclipse.org/tools/pdt/updates/latest/"

#
# The GNU ARM Eclipse is an open source project that includes a family of Eclipse plug-ins and tools
# for multi-platform embedded ARM development, based on GNU toolchains.
# See: http://marketplace.eclipse.org/content/gnu-arm-eclipse
# See: http://gnuarmeclipse.github.io/
# Features:
# ilg.gnuarmeclipse.codered
# ilg.gnuarmeclipse.debug.gdbjtag.jlink
# ilg.gnuarmeclipse.debug.gdbjtag.openocd
# ilg.gnuarmeclipse.debug.gdbjtag.pyocd
# ilg.gnuarmeclipse.debug.gdbjtag.qemu
# ilg.gnuarmeclipse.doc.user
# ilg.gnuarmeclipse.managedbuild.cross
# ilg.gnuarmeclipse.packs
# ilg.gnuarmeclipse.templates.ad
# ilg.gnuarmeclipse.templates.cortexm
# ilg.gnuarmeclipse.templates.freescale
# ilg.gnuarmeclipse.templates.stm
mirror_p2 "http://gnuarmeclipse.sourceforge.net/updates/"










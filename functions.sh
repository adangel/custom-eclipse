###########################
# Functions
###########################

#
# Mirrors an old-style update site (not a p2 repository)
# Can mirror multiple sites into one mirror. The sites are merged.
#
# $1 - Source URL of the update site like you would enter it in Eclipse
#
function mirror_site()
{
echo "Mirroring site $1..."
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
    -verbose \
    -application org.eclipse.equinox.p2.artifact.repository.mirrorApplication \
    -source $1 -destination $target_p2
java -jar $eclipse_home/plugins/org.eclipse.equinox.launcher_*.jar \
    -verbose \
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

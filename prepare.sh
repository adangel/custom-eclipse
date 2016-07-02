#####################
# Preparation
#####################
mkdir -p temp

cwd=`pwd`

# Download eclipse 3.7. Note: This needs to be prior 4.2 version, e.g. 3.7 indigo, as the later
# versions don't have the code for accessing old update sites.
eclipse_archive=$cwd/temp/eclipse-SDK-3.7.2-linux-gtk-x86_64.tar.gz
if [ ! -e $eclipse_archive ]; then
    wget -O $eclipse_archive http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops/R-3.7.2-201202080800/eclipse-SDK-3.7.2-linux-gtk-x86_64.tar.gz
fi

eclipse_home=$cwd/temp/eclipse-3.7.2
if [ ! -d $eclipse_home ]; then
   ( cd $cwd/temp; tar xfzv $eclipse_archive; mv eclipse $eclipse_home )
fi

# Local directory for downloads (see download_convert*() and svn_site_checkout())
downloads=$cwd/temp/downloads
# Local directory for the old-style update site mirror
site_mirror=$cwd/temp/mirror-sites
# Local p2 repo
target_p2=file://`pwd`/temp/p2-mirror/

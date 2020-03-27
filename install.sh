#!/usr/bin/env bash
:<<'COMMENT'
echo "This script will install RNAmut command line to \$HOME/bin and add to your \$PATH"
echo "This will add a file RNAmut to your \$HOME/bin directory and will append to your bashrc"
read -n 1 -s -r -p "Press any key to continue"
COMMENT

echo -ne "
Full path of the folder where RNAmut is installed. 
Tip: Do not use ~ here: "
read rnamut_install_dir

if test -f "${rnamut_install_dir}/RNAmut.jar"; then
    echo "Found the jar file in the install dir"
else
    echo "
    Could not find the jar file.
    Provide the FULL path to the install directory.
    Do not use \"~\"
    Exiting
    "
    exit 1
fi

echo "Creating executable in \$HOME/bin directory"
BINDIRECTORY=${HOME}/bin
mkdir -p ${BINDIRECTORY}
sed -e "s:#%JAR_FILE.*$:JAR_FILE=${rnamut_install_dir}/RNAmut.jar:g" ${rnamut_install_dir}/cli/RNAmut_Mac-Linux.sh > ${BINDIRECTORY}/RNAmut
chmod a+x ${BINDIRECTORY}/RNAmut


echo " ** Adding to your PATH **
You may already have a directory \$HOME/bin in your \$PATH, in which case you can skip this step
"

while true; do
    read -p 'Do you want to append to bashrc? (y/n): ' install_option

    case "${install_option}" in
	[Yy]* )
	    bashrc_bkup="${rnamut_install_dir}/bashrc_backup"
	    cp $HOME/.bashrc ${bashrc_bkup}
	    echo "Backed up your existing .bashrc to ${bashrc_bkup}"
	    echo "#### RNAmut" >> $HOME/.bashrc
	    echo "export PATH=\$HOME/bin/:\$PATH" >> $HOME/.bashrc 
	    exit 0;;
	[Nn]* )
	    echo "If you want to add it yourself at a later time, add the following command to your .bashrc"
	    echo "export PATH=\$HOME/bin/:\$PATH"
	    exit 0;;
	* )
	    printf "%s\n" '(y/n)'
    esac
done


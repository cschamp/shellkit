# paths
local usrlocal=/usr/local
typeset -U path manpath fpath # no dupes
path=(~/bin $usrlocal/bin $usrlocal/sbin /usr/bin /usr/sbin /bin /sbin /Developer/usr/bin /usr/games /usr/bin/X11 $path)
manpath=(/usr/share/man /usr/local/man /usr/X11R6/man /opt/vmware/man $manpath)
export MANPATH
fpath=(~/.zsh/functions $fpath)
export LD_LIBRARY_PATH=/usr.local/lib:$LD_LIBRARY_PATH
case $HOST in
	selectric*)
		ami="${HOME}/projects/installers/InstallerDev/Mac/Main/AMI"
		installerdev="${HOME}/projects/installers/InstallerDev"
		scmdir="${HOME}/projects/installers/scm/Elements/Mac/Scripts/3.0"
		scm="${HOME}/projects/installers/scm"
		psdir="${HOME}/projects/installers/scm/Photoshop"
		omdir="${HOME}/projects/installers/tools/overmind"
		acr="${HOME}/projects/installers/tools/overmind/release/acr"
		tools="${HOME}/projects/installers/tools"
		;;
	*)
		ami="${HOME}/projects/redcloud/1700/InstallerDev/Mac/Main/AMI"
		installerdev="${HOME}/projects/redcloud/1700/InstallerDev"
		scmdir="${HOME}/projects/redcloud/1700/scm/Elements/Mac/Scripts/3.0"
		scm="${HOME}/projects/redcloud/1700/scm"
		psdir="${HOME}/projects/redcloud/1700/scm/Photoshop"
		omdir="${HOME}/projects/redcloud/1700/tools/overmind"
		acr="${HOME}/projects/redcloud/1700/tools/overmind/release/acr"
		tools="${HOME}/projects/redcloud/1700/tools"
		;;
esac
psx="${HOME}/projects/psmake/PSMain/main/photoshop/xcode"
pspi="${HOME}/projects/psmake/PSMain/main/plugins/build/build system files/xcode"
# XXX [[ -f /Applications/p4merge.app/Contents/MacOS/p4merge ]] && export P4DIFF=/Applications/p4merge.app/Contents/MacOS/p4merge

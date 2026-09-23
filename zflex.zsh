# Zflex - Zsh plugin manager without bloat and skill issiu
# Created by: https://codeberg.org/xeks-happiness
# Licensed under: 0BSD License
# Inspired by: https://github.com/mattmc3/zsh_unplugged

# Standarized way of handling plugin directory,
# regardless of functionargzero and posixargzero,
# and with an option for a plugin manager to alter
# the plugin directory (i.e. set ZERO parameter)
# Allows using ${0:A:h} to get path of plugin
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Save location of this file in variable for easier use
ZFLEX_HOME="${0:A:h}"

typeset -gx ZFLEX_PLUGIN_DIR="${ZFLEX_PLUGIN_DIR:-$ZFLEX_HOME/plugins/}"

# [ Main cli function ]
function zflex() {
	local subcommand="$1"
	shift

	case "$subcommand" in
		clone)
			$ZFLEX_HOME/scripts/clone "$@"
			;;
		source)
			$ZFLEX_HOME/scripts/source "$@"
			;;
		update)
			$ZFLEX_HOME/scripts/update "$@"
			;;
	esac

	$ZFLEX_HOME/scripts/optimize
}

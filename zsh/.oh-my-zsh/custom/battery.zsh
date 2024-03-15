# Apple Silicon laptops with firmware > 13.0 have a native charge threshold that does not required any userspace daemon running.
# This native limit works even when the laptop is sleeping or powered off therefore it is preferable to the userspace daemon.
# Nonetheless, it only works with fixed thresholds (80% as upper limit and 70% as lower limit).
# CHWA key is the one used to enable/disable the native limit. 01 = 80% limit, 00 = no limit
##
typeset -g smc_command="/Users/johnzeng/.local/bin/smc"
typeset -g smc_charge_limit_key="CHWA"
typeset -g smc_charge_limit_status_on="01"
typeset -g smc_charge_limit_status_off="00"

battery-charge-limit-enable () {
	if [[ "$(uname)" == "Darwin" ]]; then
		if [[ ! -e "${smc_command}" ]]; then
			echo 'SMC command not found!'
			return 1
		fi

		sudo "${smc_command}" -k "${smc_charge_limit_key}" -w "${smc_charge_limit_status_on}"
	else
		echo "Not a Darwin system."
	fi
}

battery-charge-limit-disable () {
	if [[ "$(uname)" == "Darwin" ]]; then
		if [[ ! -e "${smc_command}" ]]; then
			echo 'SMC command not found!'
			return 1
		fi

		sudo "${smc_command}" -k "${smc_charge_limit_key}" -w "${smc_charge_limit_status_off}"
	else
		echo "Not a Darwin system."
	fi
}

battery-charge-limit-status () {
	if [[ "$(uname)" == "Darwin" ]]; then
		if [[ ! -e "${smc_command}" ]]; then
			echo 'SMC command not found!'
			return 1
		fi

		local status_raw="$(sudo "${smc_command}" -k "${smc_charge_limit_key}" -r)"

		# Extract the bytes using regex
		if [[ "$status_raw" =~ 'bytes ([0-9]+)' ]]; then
			status_raw=$match[1]
		fi

		case "$status_raw" in
			"${smc_charge_limit_status_on}")
				echo "on"
				;;
			"${smc_charge_limit_status_off}")
				echo "off"
				;;
			*)
				echo "Unknown ${smc_charge_limit_key} status: $status_raw"
				;;
		esac
	else
		echo "Not a Darwin system."
	fi
}

prompt_battery_charge_limit () {
  status_raw=$(battery-charge-limit-status)

  if [[ $status_raw == "on" ]]; then
    p10k segment -f green -b 240 -i '󱞜' -t 'ON' 
  fi

  if [[ $status_raw == "off" ]]; then
    p10k segment -f yellow -i '󱞝' -t 'OFF'
  fi
}

instant_prompt_battery_charge_limit () {
  prompt_battery_charge_limit
}

#!/usr/bin/env bash 
{ 
    l_hbfw="" 
    if systemctl is-enabled firewalld.service | grep -q 'enabled' && systemctl is-enabled nftables.service | grep -q 'enabled'; then 
        echo -e "\n - Error - Both FirewallD and NFTables are enabled\n - Please follow recommendation: \"Ensure a single firewall configuration utility is in use\"" 
    elif ! systemctl is-enabled firewalld.service | grep -q 'enabled' && ! systemctl is-enabled nftables.service | grep -q 'enabled'; then 
        echo -e "\n - Error - Neither FirewallD or NFTables is enabled\n - Please follow recommendation: \"Ensure a single firewall configuration utility is in use\"" 
    else 
        if systemctl is-enabled firewalld.service | grep -q 'enabled' && ! systemctl is-enabled nftables.service | grep -q 'enabled'; then 
            echo -e "\n - FirewallD is in use on the system" && l_hbfw="fwd" 
        elif ! systemctl is-enabled firewalld.service | grep -q 'enabled' && systemctl is-enabled nftables.service | grep -q 'enabled'; then 
            echo -e "\n - NFTables is in use on the system" && l_hbfw="nft" 
        fi 
        l_ipsaddr="$(nft list ruleset | awk '/filter_IN_public_deny|hook\s+input\s+/,/\}\s*(#.*)?$/' | grep -P -- 'ip\h+saddr')" 
        if ! nft list ruleset | awk '/hook\s+input\s+/,/\}\s*(#.*)?$/' | grep -Pq -- '\H+\h+"lo"\h+accept'; then 
            echo -e "\n - Enabling input to accept for loopback address" 
            if [ "$l_hbfw" = "fwd" ]; then 
                firewall-cmd --permanent --zone=trusted --add-interface=lo 
                firewall-cmd --reload 
            elif [ "$l_hbfw" = "nft" ]; then 
                nft add rule inet filter input iif lo accept 
            fi 
        fi 
        if ! grep -Pq -- 'ip\h+saddr\h+127\.0\.0\.0\/8\h+(counter\h+packets\h+\d+\h+bytes\h+\d+\h+)?drop' <<< "$l_ipsaddr" && ! grep -Pq -- 'ip\h+daddr\h+\!\=\h+127\.0\.0\.1\h+ip\h+saddr\h+127\.0\.0\.1\h+drop' <<< "$l_ipsaddr"; then 
            echo -e "\n - Setting IPv4 network traffic from loopback address to drop" 
            if [ "$l_hbfw" = "fwd" ]; then 
                firewall-cmd --permanent --add-rich-rule='rule family=ipv4 source address="127.0.0.1" destination not address="127.0.0.1" drop' 
                firewall-cmd --permanent --zone=trusted --add-rich-rule='rule family=ipv4 source address="127.0.0.1" destination not address="127.0.0.1" drop' 
                firewall-cmd --reload 
            elif [ "$l_hbfw" = "nft" ]; then 
                nft create rule inet filter input ip saddr 127.0.0.0/8 counter drop 
            fi 
        fi 

        if grep -Pq -- '^\h*0\h*$' /sys/module/ipv6/parameters/disable; then 
            l_ip6saddr="$(nft list ruleset | awk '/filter_IN_public_deny|hook input/,/}/' | grep 'ip6 saddr')" 
            if ! grep -Pq 'ip6\h+saddr\h+::1\h+(counter\h+packets\h+\d+\h+bytes\h+\d+\h+)?drop' <<< "$l_ip6saddr" && ! grep -Pq -- 'ip6\h+daddr\h+\!=\h+::1\h+ip6\h+saddr\h+::1\h+drop' <<< "$l_ip6saddr"; then 
                echo -e "\n - Setting IPv6 network traffic from loopback address to drop" 
                if [ "$l_hbfw" = "fwd" ]; then 
                    firewall-cmd --permanent --add-rich-rule='rule family=ipv6 source address="::1" destination not address="::1" drop' 
                    firewall-cmd --permanent --zone=trusted --add-rich-rule='rule family=ipv6 source address="::1" destination not address="::1" drop' 
                    firewall-cmd --reload 
                elif [ "$l_hbfw" = "nft" ]; then 
                    nft add rule inet filter input ip6 saddr ::1 counter drop 
                fi 
            fi 
        fi 
    fi 
}

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
            if ! nft list tables | grep -Pq -- 'table'; then 
                echo -e "\n - No tables found, create table firewalld"
                nft create table inet firewalld
            fi
        elif ! systemctl is-enabled firewalld.service | grep -q 'enabled' && systemctl is-enabled nftables.service | grep -q 'enabled'; then 
            echo -e "\n - NFTables is in use on the system" && l_hbfw="nft" 
            if ! nft list tables | grep -Pq -- 'table'; then 
                echo -e "\n - No tables found, create table filter"
                nft create table inet filter
            fi
        fi 
    fi 
}

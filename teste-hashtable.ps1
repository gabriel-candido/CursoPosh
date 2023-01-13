#teste com hash table
Clear
$servidores = [ordered] @{server1="127.0.0.1";server2="127.0.0.2";server3="127.0.0.3"}

$servidores

#adicionar
$servidores["server4"] = "127.0.0.4"

#$servidores

#remover
$servidores.remove("server4")
$servidores.Count

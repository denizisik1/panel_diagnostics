while true; do
    {  
        echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\n$(cpu_usage)"
    } | nc -l -p 8080
done

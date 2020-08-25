server {
    listen 80;
    listen [::]:80;

    server_name admin.example.com;

    location /apks {
        root /root/;
        autoindex on;
        add_header 'Access-Control-Allow-Origin' '*';
    }

    location / {
    proxy_pass http://localhost:8080/;
        proxy_set_header X-Real-IP $remote_addr;
        client_max_body_size 100M;
    }
}
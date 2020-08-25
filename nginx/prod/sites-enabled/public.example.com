server {
    listen 80;
    listen [::]:80;

    server_name public.example.com;

    root /root/filebrowser/srv;

    location / {
        # Setting for line bot
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ terms.html =404;
        rewrite '^/resources/(.*)\.(png|jpg|gif)/1040$' /resources/$1.$2;
        rewrite '^/resources/(.*)\.(png|jpg|gif)/240$' /resources/$1.$2;
        rewrite '^/resources/(.*)\.(png|jpg|gif)/360$' /resources/$1.$2;
        rewrite '^/resources/(.*)\.(png|jpg|gif)/460$' /resources/$1.$2;
        rewrite '^/resources/(.*)\.(png|jpg|gif)/700$' /resources/$1.$2;
    }
}
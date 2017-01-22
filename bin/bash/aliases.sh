# aliases - for awesomely maximized laziness

alias aliases='nano ~/.bash_aliases'

alias fresh_bash='source ~/.bashrc'

alias nginx_conf='nano /etc/nginx/nginx.conf'

alias unicorn_conf='nano /etc/unicorn.conf'

alias rakes='rake db:migrate RAILS_ENV=production && rake assets:precompile RAILS_ENV=production'

alias cdrails='cd /home/rails/simplr'

alias railc='cdrails && rails c production'

alias logs='cdrails && vi log/production.log'

alias unicorn_logs='vi /var/log/unicorn/unicorn.log'

alias pull='git pull'

alias unicornnn='service unicorn start'

alias killunicorn='service unicorn stop'

alias fresh='killunicorn && cdrails && pull && bundle install && rakes && unicornnn'


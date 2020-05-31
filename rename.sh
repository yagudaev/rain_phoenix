#!/bin/sh

# tested on macOS 10.12.4
# based on https://elixirforum.com/t/how-to-change-a-phoenix-project-name-smoothly/1217/6

# replace values as necessary
current_otp="phoenix_order_form"
current_name="PhoenixOrderForm"
new_otp="rain_phoenix"
new_name="RainPhoenix"

git grep -l $current_otp | xargs sed -i '' -e 's/'$current_otp'/'$new_otp'/g'
git grep -l $current_name | xargs sed -i '' -e 's/'$current_name'/'$new_name'/g'
mv ./lib/$current_otp ./lib/$new_otp
mv ./lib/$current_otp.ex ./lib/$new_otp.ex

# calendso-buildpack

Be careful, Calendso build take space and you might need to set your container limit to a higher value. 
If you are working on Scalingo you can ask them to set this value higher.

## Config :
Set CALENDSO_VERSION to the desire version (without the "v")

docker run --name calendso -it -p 8065:8065 -v "$(pwd)"/.env:/env/.env -v "$(pwd)":/buildpack scalingo/scalingo-18:latest bash

bash buildpack/bin/detect
bash buildpack/bin/compile /build /cache /env
bash buildpack/bin/release

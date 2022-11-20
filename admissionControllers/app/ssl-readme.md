<!-- https://www.youtube.com/watch?v=dDU178Uezc0 -->

# windows 10
git bash -> cd certs-dir

winpty openssl genrsa -des3 -out myCA.key 2048
winpty openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem

fill 'Common Name'

# add pem file cert to local trust certs
win+R -> mmc -> File/Add_Remove Snap-in/Certificates/Add/select 'Computer account'

# generate private key for local domain
winpty openssl genrsa -out hellfish.test.key 2048
winpty openssl req -new -key hellfish.test.key -out hellfish.test.csr

#
winpty openssl x509 -req -in hellfish.test.csr -CA myCA.pem -CAkey myCA.key -CAcreateserial -out hellfish.test.crt -days 825 -sha256 -extfile hellfish.test.ext
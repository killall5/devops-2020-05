#!/bin/sh

apt-get update

apt-get install -y --no-install-recommends nginx

cat >/var/www/html/index.html <<EOF
	<html>
		<body>
			<p>Hello, World!</p>
		</body>
	</html>
EOF

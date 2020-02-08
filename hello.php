<?php
print_r(boolval(strpos(strval($_SERVER['HTTP_HOST']), "localhost")));
echo "HELLO";
echo strval($_SERVER['HTTP_HOST']);
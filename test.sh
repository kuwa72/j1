#! /usr/bin/env bash

t() {
  actual=$(./j1 $2)
  expected=$1

  if [[ $actual != $expected ]];then
    echo Failed, expected $expected but actual $actual
  fi
}

t 'Hello, world!' 'System.out.println("Hello, world!\n")'

t 20 "$(cat << EOL
int i = 100;
i= i++ / 5;
System.out.println(i);
EOL
)"

t smaller "$(cat << EOL
int i = 30;
if (i > 50) {
  System.out.println("larger");
} else {
  System.out.println("smaller");
}
EOL
)"


t foobarbazz "$(cat <<EOL
System.out.println("foo"+"bar"+"bazz");
EOL
)"

t foobarbazz "$(cat <<EOL
StringBuilder sb = new StringBuilder();
System.out.println(sb.append("foo").append("bar").append("bazz").toString());
EOL
)"

t August "$(cat <<EOL
        int month = 8;
        String monthString;
        switch (month) {
            case 1:  monthString = "January";
                     break;
            case 2:  monthString = "February";
                     break;
            case 3:  monthString = "March";
                     break;
            case 4:  monthString = "April";
                     break;
            case 5:  monthString = "May";
                     break;
            case 6:  monthString = "June";
                     break;
            case 7:  monthString = "July";
                     break;
            case 8:  monthString = "August";
                     break;
            case 9:  monthString = "September";
                     break;
            case 10: monthString = "October";
                     break;
            case 11: monthString = "November";
                     break;
            case 12: monthString = "December";
                     break;
            default: monthString = "Invalid month";
                     break;
        }
        System.out.println(monthString);
EOL
)"



String regex = '<[^>]*>';
String body = '<string>';
Pattern p = Pattern.compile(regex);
Matcher m = p.matcher(body);
Boolean a = m.matches();
Boolean b = m.find();
System.debug(a);
System.debug(b);
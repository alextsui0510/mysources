// Generated by ALEX in fast((0)1) mode
// https://github.com/alextsui0510

var proxy = __PROXY__;

var direct = 'DIRECT;';

var domains = __DOMAINS__;

function FindProxyForURL(url, host) {	 
       if (/google/i.test(host)) return proxy;	    
       if (/github/i.test(host)) return proxy;	      
  do {		         
       if (domains.hasOwnProperty(host)) return proxy;
               off  = host.indexOf('.') + 1;
  	       host = host.slice(off);
     } while (off >= 1);
       return direct;
}

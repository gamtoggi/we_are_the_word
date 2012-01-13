javascript:(function(){
  f='http://localhost:3003/cards/build?word='+encodeURIComponent(document.getSelection());  
  window.open(f, 'weword','location=yes,links=no,scrollbars=no,toolbar=no,width=500,height=500')  
})()
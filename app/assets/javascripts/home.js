// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// var handler = StripeCheckout.configure({
//   key: 'pk_test_DlY1vDGmSjyuRgmVxFMaPHN9',
//   // image: '/square-image.png',
//   token: function(token, args) {
//     var request, data;
//     // Use the token to create the charge with a server-side script.
//     debugger;
//     xhr = new XMLHttpRequest();
//     xhr.open('POST', '/subscriptions', true);
//     xhr.setRequestHeader('X-CSRF-Token', document.querySelector('meta[name=csrf-token]').content);
//     xhr.setRequestHeader('Content-Type', 'application/json');
//     data = {subscription: {token: token.id, user_id: '12'}};
//     xhr.send(JSON.stringify(data));
//   }
// });

// document.getElementById('customButton').addEventListener('click', function(e) {
//   // Open Checkout with further options
//   handler.open({
//     name: 'ShoutTrout Subscription',
//     email: 'duck@tummies.com',
//     description: 'Monthly ($6.00)',
//     amount: 600
//   });
//   e.preventDefault();
// });

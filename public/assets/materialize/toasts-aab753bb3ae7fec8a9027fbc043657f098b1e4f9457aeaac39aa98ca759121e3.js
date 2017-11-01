function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}var _createClass=function(){function e(e,t){for(var n=0;n<t.length;n++){var a=t[n];a.enumerable=a.enumerable||!1,a.configurable=!0,"value"in a&&(a.writable=!0),Object.defineProperty(e,a.key,a)}}return function(t,n,a){return n&&e(t.prototype,n),a&&e(t,a),t}}();!function(e,t){"use strict";var n={displayLength:Infinity,inDuration:300,outDuration:375,className:undefined,completeCallback:undefined,activationPercent:.8},a=function(){function a(t,n,s,o){if(_classCallCheck(this,a),t){this.options={displayLength:n,className:s,completeCallback:o},this.options=e.extend({},a.defaults,this.options),this.message=t,this.panning=!1,this.timeRemaining=this.options.displayLength,0===a._toasts.length&&a._createContainer(),a._toasts.push(this);var i=this.createToast();i.M_Toast=this,this.el=i,this._animateIn(),this.setTimer()}}return _createClass(a,[{key:"createToast",value:function(){var t=document.createElement("div");if(t.classList.add("toast"),this.options.className){var n=this.options.className.split(" "),s=void 0,o=void 0;for(s=0,o=n.length;s<o;s++)t.classList.add(n[s])}return("object"==typeof HTMLElement?this.message instanceof HTMLElement:this.message&&"object"==typeof this.message&&null!==this.message&&1===this.message.nodeType&&"string"==typeof this.message.nodeName)?t.appendChild(this.message):this.message instanceof jQuery?e(t).append(this.message):t.innerHTML=this.message,a._container.appendChild(t),t}},{key:"_animateIn",value:function(){t(this.el,{top:0,opacity:1},{duration:300,easing:"easeOutCubic",queue:!1})}},{key:"setTimer",value:function(){var e=this;this.timeRemaining!==Infinity&&(this.counterInterval=setInterval(function(){e.panning||(e.timeRemaining-=20),e.timeRemaining<=0&&e.remove()},20))}},{key:"remove",value:function(){var e=this;window.clearInterval(this.counterInterval);var n=this.el.offsetWidth*this.options.activationPercent;this.wasSwiped&&(this.el.style.transition="transform .05s, opacity .05s",this.el.style.transform="translateX("+n+"px)",this.el.style.opacity=0),t(this.el,{opacity:0,marginTop:"-40px"},{duration:this.options.outDuration,easing:"easeOutExpo",queue:!1,complete:function(){"function"==typeof e.options.completeCallback&&e.options.completeCallback(),e.el.parentNode.removeChild(e.el),a._toasts.splice(a._toasts.indexOf(e),1),0===a._toasts.length&&a._removeContainer()}})}}],[{key:"_createContainer",value:function(){var e=document.createElement("div");e.setAttribute("id","toast-container"),e.addEventListener("touchstart",a._onDragStart),e.addEventListener("touchmove",a._onDragMove),e.addEventListener("touchend",a._onDragEnd),e.addEventListener("mousedown",a._onDragStart),document.addEventListener("mousemove",a._onDragMove),document.addEventListener("mouseup",a._onDragEnd),document.body.appendChild(e),a._container=e}},{key:"_removeContainer",value:function(){document.removeEventListener("mousemove",a._onDragMove),document.removeEventListener("mouseup",a._onDragEnd),a._container.parentNode.removeChild(a._container),a._container=null}},{key:"_onDragStart",value:function(t){if(t.target&&e(t.target).closest(".toast").length){var n=e(t.target).closest(".toast"),s=n[0].M_Toast;s.panning=!0,a._draggedToast=s,s.el.classList.add("panning"),s.el.style.transition="",s.startingXPos=a._xPos(t),s.time=Date.now(),s.xPos=a._xPos(t)}}},{key:"_onDragMove",value:function(e){if(a._draggedToast){e.preventDefault();var t=a._draggedToast;t.deltaX=Math.abs(t.xPos-a._xPos(e)),t.xPos=a._xPos(e),t.velocityX=t.deltaX/(Date.now()-t.time),t.time=Date.now();var n=t.xPos-t.startingXPos,s=t.el.offsetWidth*t.options.activationPercent;t.el.style.transform="translateX("+n+"px)",t.el.style.opacity=1-Math.abs(n/s)}}},{key:"_onDragEnd",value:function(){if(a._draggedToast){var e=a._draggedToast;e.panning=!1,e.el.classList.remove("panning");var t=e.xPos-e.startingXPos,n=e.el.offsetWidth*e.options.activationPercent;Math.abs(t)>n||e.velocityX>1?(e.wasSwiped=!0,e.remove()):(e.el.style.transition="transform .2s, opacity .2s",e.el.style.transform="",e.el.style.opacity=""),a._draggedToast=null}}},{key:"_xPos",value:function(e){return e.targetTouches&&e.targetTouches.length>=1?e.targetTouches[0].clientX:e.clientX}},{key:"removeAll",value:function(){for(var e in a._toasts)a._toasts[e].remove()}},{key:"defaults",get:function(){return n}}]),a}();a._toasts=[],a._container=null,a._draggedToast=null,Materialize.Toast=a,Materialize.toast=function(e,t,n,s){return new a(e,t,n,s)}}(jQuery,Materialize.Vel);
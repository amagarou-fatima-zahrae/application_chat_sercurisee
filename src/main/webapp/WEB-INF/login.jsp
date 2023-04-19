


<%@ page language="java" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />

    <title>ChatApp
    </title>
    <style>
    
    /* Nice Select CSS */
.nice-select {
  -webkit-tap-highlight-color: transparent;
  background-color: #f8f8f8;
  border-radius: 50px;
  border: solid 1px transparent;
  box-sizing: border-box;
  clear: both;
  cursor: pointer;
  display: block;
  float: left;
  font-family: inherit;
  font-size: 18px;
  font-weight: normal;
  height: 42px;
  line-height: 40px;
  outline: none;
  padding-left: 30px;
  padding-right: 30px;
  position: relative;
  text-align: left !important;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  white-space: nowrap;
  width: 200px;
}
.nice-select:hover {
  border-color: #dbdbdb;
}
.nice-select:active,
.nice-select.open,
.nice-select:focus {
  border-color: #999;
}
.nice-select:after {
  border-bottom: 2px solid #363636;
  border-right: 2px solid #363636;
  content: "";
  display: block;
  height: 5px;
  margin-top: -4px;
  pointer-events: none;
  position: absolute;
  right: 30px;
  top: 50%;
  -webkit-transform-origin: 66% 66%;
  -ms-transform-origin: 66% 66%;
  transform-origin: 66% 66%;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
  -webkit-transition: all 0.15s ease-in-out;
  transition: all 0.15s ease-in-out;
  width: 5px;
}
.nice-select.open:after {
  -webkit-transform: rotate(-135deg);
  -ms-transform: rotate(-135deg);
  transform: rotate(-135deg);
}
.nice-select.open .list {
  top: auto !important;
  bottom: 100%;
  opacity: 1;
  pointer-events: auto;
  -webkit-transform: scale(1) translateY(0);
  -ms-transform: scale(1) translateY(0);
  transform: scale(1) translateY(0);
}
.nice-select.disabled {
  border-color: #ededed;
  color: #999;
  pointer-events: none;
}
.nice-select.disabled:after {
  border-color: #cccccc;
}
.nice-select.wide {
  width: 100%;
}
.nice-select.wide .list {
  left: 0 !important;
  right: 0 !important;
}
.nice-select.right {
  float: right;
}
.nice-select.right .list {
  left: auto;
  right: 0;
}
.nice-select.small {
  font-size: 18px;
  height: 50px;
  line-height: 34px;
}
.nice-select.small:after {
  height: 4px;
  width: 4px;
}
.nice-select.small .option {
  line-height: 34px;
  min-height: 34px;
}
.nice-select .list {
  background-color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 0 1px rgba(68, 68, 68, 0.11);
  box-sizing: border-box;
  margin-top: 4px;
  opacity: 0;
  overflow: hidden;
  padding: 0;
  pointer-events: none;
  position: absolute;
  bottom: 100%;
  left: 0;
  -webkit-transform-origin: 50% 0;
  -ms-transform-origin: 50% 0;
  transform-origin: 50% 0;
  -webkit-transform: scale(0.75) translateY(-21px);
  -ms-transform: scale(0.75) translateY(-21px);
  transform: scale(0.75) translateY(-21px);
  -webkit-transition: all 0.2s cubic-bezier(0.5, 0, 0, 1.25),
    opacity 0.15s ease-out;
  transition: all 0.2s cubic-bezier(0.5, 0, 0, 1.25), opacity 0.15s ease-out;
  z-index: 9;
  width: 200px;
}
.nice-select .list:hover .option:not(:hover) {
  background-color: transparent !important;
}
.nice-select .option {
  cursor: pointer;
  font-weight: 400;
  line-height: 40px;
  list-style: none;
  min-height: 40px;
  outline: none;
  padding-left: 30px;
  padding-right: 29px;
  text-align: left;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
.nice-select .option:hover,
.nice-select .option.focus,
.nice-select .option.selected.focus {
  background-color: #f6f6f6;
}
.nice-select .option.selected {
  font-weight: bold;
}
.nice-select .option.disabled {
  background-color: transparent;
  color: #999;
  cursor: default;
}

.no-csspointerevents .nice-select .list {
  display: none;
}

.no-csspointerevents .nice-select.open .list {
  display: block;
}

/* CSS Global Rules */
* {
  box-sizing: border-box;
  font-family: "Lato", sans-serif;
  list-style-type: none;
  margin: 0;
  padding: 0;
  scroll-behavior: smooth !important;
}

html {
  font-size: 16px;
}

::selection {
  background-color: #ffffff;
  color: #d90647;
}

body {
  font-family: "Lato", sans-serif;
  color: #363636;
  font-size: 1.125rem;
  overflow-x: hidden;
}

.content {
  width: 1px; 
  margin: auto;
  margin-top: 300px;


}

.content h2 {
  color: #fff;
  font-size: 8em;
  position: absolute;
  transform: translate(-50%, -50%);
  
}

.content h2:nth-child(1) {
  color: transparent;
  -webkit-text-stroke: 2px white;
  text-shadow: 0 0 5px #aa59a6;
}

.content h2:nth-child(2) {
  color: white;
  animation: animate1 4s ease-in-out infinite;
  text-shadow: 0 0 10px #fff;
}

@keyframes animate1 {
  0%,
  100% {
    clip-path: polygon(
      0% 45%,
      16% 44%,
      33% 50%,
      54% 60%,
      70% 61%,
      84% 59%,
      100% 52%,
      100% 100%,
      0% 100%
    );
  }

  50% {
    clip-path: polygon(
      0% 60%,
      15% 65%,
      34% 66%,
      51% 62%,
      67% 50%,
      84% 45%,
      100% 46%,
      100% 100%,
      0% 100%
    );
  }
}


@keyframes animate {

    0%{
        transform: translateY(0) rotate(0deg);
        opacity: 1;
        border-radius: 0;
    }

    100%{
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
        border-radius: 50%;
    }

}
	
	img {
		float: left;
	margin: auto;
  display: block;
  border-radius: 10px;
  
  box-shadow: 0 0 15px #aa59a6;
  margin-right: 5px;
}


.login-box {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 350px;
            padding: 40px;
            transform: translate(-50%, -50%);
            background: rgba(0, 0, 0, .7);
            box-sizing: border-box;
            box-shadow: 0 15px 25px rgba(0, 0, 0, .6);
            border-radius: 10px;
        }
        
        .login-box h2 {
            margin: 0 0 30px;
            padding: 0;
            color: #fff;
            text-align: center;
            font-size: 22px;
        }
        
        .login-box .user-box {
            position: relative;
        }
        
        .login-box .user-box input {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }
        
        .login-box .user-box label {
            position: absolute;
            top: 0;
            left: 0;
            padding: 10px 0;
            font-size: 16px;
            color: #e42a36;
            pointer-events: none;
            transition: .5s;
        }
        
        .login-box .user-box input:focus~label,
        .login-box .user-box input:valid~label {
            top: -20px;
            left: 0;
            color: #e42a36;
            font-size: 12px;
        }
        .login-box form button {
            position: relative;
            margin-left: 35px;
            display: inline-block;
            padding: 10px 20px;
            color: #e42a36;
            font-size: 13px;
            text-decoration: none;
            text-transform: uppercase;
            overflow: hidden;
            transition: .5s;
            margin-top: 40px;
            letter-spacing: 4px;
            width:200px;
        }
        
        .login-box button:hover {
            background: #db0d44;
            color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 5px #db0d44, 0 0 25px #db0d44, 0 0 50px #915093, 0 0 100px #03e9f4;
        }
        
        .login-box a span {
            position: absolute;
            display: block;
        }
        
        .login-box a span:nth-child(1) {
            top: 0;
            left: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, #915093);
            animation: btn-anim1 1s linear infinite;
        }
        
        @keyframes btn-anim1 {
            0% {
                left: -100%;
            }
            50%,
            100% {
                left: 100%;
            }
        }
        
        .login-box a span:nth-child(2) {
            top: -100%;
            right: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(180deg, transparent, #03e9f4);
            animation: btn-anim2 1s linear infinite;
            animation-delay: .25s
        }
        
        @keyframes btn-anim2 {
            0% {
                top: -100%;
            }
            50%,
            100% {
                top: 100%;
            }
        }
        
        .login-box a span:nth-child(3) {
            bottom: 0;
            right: -100%;
            width: 100%;
            height: 2px;
            background: linear-gradient(270deg, transparent, #03e9f4);
            animation: btn-anim3 1s linear infinite;
            animation-delay: .5s
        }
        
        @keyframes btn-anim3 {
            0% {
                right: -100%;
            }
            50%,
            100% {
                right: 100%;
            }
        }
        
        .login-box a span:nth-child(4) {
            bottom: -100%;
            left: 0;
            width: 2px;
            height: 100%;
            background: linear-gradient(360deg, transparent, #03e9f4);
            animation: btn-anim4 1s linear infinite;
            animation-delay: .75s
        }
        
        @keyframes btn-anim4 {
            0% {
                bottom: -100%;
            }
            50%,
            100% {
                bottom: 100%;
            }
        }
img {
  max-width: 100%;
  height: auto;
}

a {
  color: #ffffff;
  text-decoration: none;
}

h1 {
  font-size: 4.5rem;
  font-weight: 900;
}

h2 {
  font-size: 3.75rem;
  font-weight: 900;
}

p {
  color: #808080;
  line-height: 2;
}

section {
  padding: 50px;
}

::placeholder {
  font-size: 18px;
  color: #808080;
}

/* Preloader */
.preloader {
  background-color: #ffffff;
  position: fixed;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  z-index: 150;
  display: flex;
  display: -ms-flexbox;
  -ms-flex-align: center;
  -ms-flex-pack: center;
  align-items: center;
  justify-content: center;
  transition: all 1s ease;
  -webkit-transition: all 1s ease;
}

.preloader.opacity-0 {
  opacity: 0;
}

.preloader .loader {
  height: 2.5rem;
  width: 2.5rem;
  border: 0.25rem solid #d90647;
  border-radius: 50%;
  border-top: 0.25rem solid transparent;
  border-bottom: 0.25rem solid transparent;
  animation: spin 2s linear infinite;
  -webkit-animation: spin 0.8s linear infinite;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
  }
}

@-webkit-keyframes spin {
  0% {
    transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
    -webkit-transform: rotate(360deg);
  }
}
/* End: Preloader */

/* End: CSS Global Rules */

/* Reusable Components */
.bold-text {
  font-weight: 700;
}

.btn {
  background: #fff;
  padding: 0.9375rem 2.5rem;
  color: #363636;
  border-radius: 3.125rem;
  font-size: 1.125rem;
  font-weight: 700;
  text-align: center;
  box-shadow: 10px 0 40px rgba(0, 0, 0, 0.15);
  display: inline-block;
  cursor: pointer;
}

.btn:hover {
  background: #fff;
  color: #ffffff;
  transition: 0.3s;
  transform: scale(1.03);
}

.red_dot {
  background: linear-gradient(to bottom, #d90647 10%, #eb402c 100%);
  background-clip: border-box;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.section-description {
  margin-top: 180px;
}

.little-description {
  margin-top: 1.875rem;
  font-size: 1.125rem;
}

.row {
  max-width: 1176px;
  margin: auto;
}
/* End: Reusable Components */

/* Main CSS Rules */

/* Header Section Styling */
#home {
  background: #d90647; /* Old browsers */
  background: -moz-linear-gradient(
    top,
    #d90647 37%,
    #eb402c 98%
  ); /* FF3.6-15 */
  background: -webkit-linear-gradient(
    top,
    #d90647 37%,
    #eb402c 98%
  ); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(
    to bottom,
    #d90647 37%,
    #eb402c 98%
  ); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d90647', endColorstr='#eb402c',GradientType=0 ); /* IE6-9 */
  background-repeat: no-repeat;
  color: #ffffff;
  height: 100%;
  width: 100%;
  padding: 50px;
  position: relative;
}

/* Navbar Styling */
nav {
  display: flex;
  flex-flow: row;
  justify-content: space-between;
}

.logo {
  font-size: 3.125rem;
  font-weight: 900;
}

#navbar ul li {
  display: inline-block;
  margin: 20px;
  font-size: 18px;
  font-weight: 400;
}

#navbar ul li:hover {
  text-decoration: line-through;
}

/* Sticky Navbar */
.sticky {
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  background-color: #fff;
  z-index: 500;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  color: #d90647;
  padding: 10px 40px;
  transition: 0.3s;
}

.sticky .logo {
  color: #d90647;
}

.sticky #navbar ul li a {
  color: #363636;
}

.sticky #navbar ul li a:hover {
  color: #d90647;
}

.sticky .navbar {
  padding: 10px;
}

.sticky .mobile-menu {
  font-size: 1.875rem;
  float: right;
  display: block;
  margin: -10px 10px;
}

/* Mobile Navbar Styling */
#myNav {
  display: block;
}
#mobileNav {
  position: absolute;
  right: 10%;
  display: none; /* Hide Mobile Nav on Desktop or big devices */
  cursor: pointer;
  user-select: none;
}

#mobileNav span {
  font-size: 1.875rem;
}

.mobileNavOverlay {
  width: 0;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  background-color: #ffffff;
  z-index: 9999;
  overflow: hidden;
  color: #d90647;
  transition: 0.3s;
  text-align: center;
}

.overlay-content {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.overlay-content a {
  color: #363636;
  font-size: 1.875rem;
  font-weight: 600;
  display: block;
  margin-top: 1.25rem;
  letter-spacing: 0.1875rem;
}

.overlay-content a:hover {
  color: #d90647;
}
/* End: Mobile Menu Styling */

/* Hero Section Styling */

#hero {
  margin: 100px 0;
}

.hero-description {
  margin-top: 3.125rem;
  float: left;
  margin-left: 1.875rem;
}

.hero-description p {
  font-size: 1.25rem;
  margin-top: 1.25rem;
  margin-bottom: 5rem;
  color: #fff;
}

.download-btn {
  background: linear-gradient(to bottom, #d90647 10%, #eb402c 100%);
  background-clip: border-box;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.hero-img {
  max-width: 28% !important;
  float: right;
  z-index: 1;
  position: absolute;
  /* right: 9.375rem; */
}

/* Custom Shape Divider */

.shape-divider {
  margin-top: 100px;
}

.custom-shape-divider-bottom-1603385849 {
  position: absolute;
  bottom: -2px;
  left: 0;
  width: 100%;
  overflow: hidden;
  line-height: 0;
  transform: rotate(180deg);
}

.custom-shape-divider-bottom-1603385849 svg {
  position: relative;
  display: block;
  width: calc(100% + 1.3px);
  height: 150px;
  transform: rotateY(180deg);
  z-index: -1;
}

.custom-shape-divider-bottom-1603385849 .shape-fill {
  fill: #ffffff;
}

#scrollUp {
  display: none; /* Hidden by default */
  position: fixed; /* Fixed/sticky position */
  bottom: 20px; /* Place the button at the bottom of the page */
  right: 30px; /* Place the button 30px from the right */
  z-index: 99; /* Make sure it does not overlap */
  border: none; /* Remove borders */
  outline: none; /* Remove outline */
  background: #d90647; /* Old browsers */
  background: -moz-linear-gradient(
    top,
    #d90647 37%,
    #eb402c 98%
  ); /* FF3.6-15 */
  background: -webkit-linear-gradient(
    top,
    #d90647 37%,
    #eb402c 98%
  ); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(
    to bottom,
    #d90647 37%,
    #eb402c 98%
  ); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d90647', endColorstr='#eb402c',GradientType=0 ); /* IE6-9 */
  background-repeat: no-repeat;
  color: #ffffff; /* Text color */
  cursor: pointer; /* Add a mouse pointer on hover */
  width: 50px;
  height: 50px;
  border-radius: 50%; /* Rounded corners */
  font-size: 18px; /* Increase font size */
  box-shadow: 0 10px 30px rgba(54, 54, 54, 0.3);
}

#scrollUp:hover {
  background-color: #555; /* Add a dark-grey background on hover */
  transform: scale(1.1);
  transition: 0.3s;
}

/* End: Header Section Styling */

/* Features Section Styling */
#features {
  height: 100%;
  padding-bottom: 200px;
  border-bottom: 1px solid #e0e0e0;
}

.features_3 {
  float: right;
}

.second-features-row {
  margin-top: 6.25rem;
}
/* End: Features Section Styling */

/* Testimonial Section Styling */
#testimonial {
  margin-top: 50px;
}
#testimonial .stylish_heading {
  text-align: center;
}
#testimonial .row {
  margin-top: 6.25rem;
}

.bubble {
  background-color: #fff;
  border: 1px solid #dfdfdf;
  padding: 20px 30px;
  position: relative;
}

.bubble::after {
  display: block;
  position: absolute;
  content: "";
  top: 100%;
  left: 5%;
  transform: translate(50%, -50%) rotate(45deg) translateZ(0);
  height: 15px;
  width: 15px;
  background: linear-gradient(-45deg, #fff 52%, transparent 0);
  border: inherit;
  border-width: 0 1px 1px 0;
  border-radius: 0 0 2px 0;
}

.bubble:hover {
  border: 1px solid transparent;
  cursor: pointer;
  transform: translateY(-20px);
  transition: 0.3s;
  box-shadow: 0 30px 60px rgba(0, 0, 0, 0.1);
}

.company-name {
  background: linear-gradient(to bottom, #d90647 10%, #eb402c 100%);
  background-clip: border-box;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  font-weight: 700;
}

.message {
  margin-bottom: 20px;
  font-style: italic;
  line-height: 1.5;
  font-size: 18px;
}

.client-info {
  margin-top: 1.875rem;
  display: flex;
  flex-flow: row;
  justify-content: start;
  align-items: center;
}

.name h4 {
  line-height: 1.5 !important;
}

.avatar {
  border-radius: 50%;
  width: 60px;
  margin-right: 20px;
}

.role {
  font-size: 16px;
  line-height: 1;
}
/* End: Testimonial Section Styling */

/* How To Section Styling */
#howto {
  background: #d90647; /* Old browsers */
  background: -moz-linear-gradient(
    top,
    #d90647 37%,
    #eb402c 98%
  ); /* FF3.6-15 */
  background: -webkit-linear-gradient(
    top,
    #d90647 37%,
    #eb402c 98%
  ); /* Chrome10-25,Safari5.1-6 */
  background: linear-gradient(
    to bottom,
    #d90647 37%,
    #eb402c 98%
  ); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#d90647', endColorstr='#eb402c',GradientType=0 ); /* IE6-9 */
  background-repeat: no-repeat;
  color: #ffffff;
  height: 24.375rem;
  width: 100%;
  position: relative;
  margin-top: 6.25rem;
}

#howto p {
  color: #ffffff;
  font-size: 16px;
  line-height: 1.75;
}

#howto h4 {
  font-size: 1.5rem;
  font-weight: 900;
}

.first-col {
  text-align: right;
  float: right;
}

.third-col {
  text-align: left;
  float: left;
}

.big_image {
  /* position: absolute;
  top: -66px; */
  max-width: 325px;
  margin-top: -125px;
}

.first-item,
.last-item {
  display: flex;
}

.item-icon1 {
  margin-left: 40px;
}

.item-icon1:hover,
.item-icon2:hover {
  transition: 0.3s;
  transform: scale(1.1);
  cursor: pointer;
}

.item-icon2 {
  margin-right: 40px;
}

.first-item,
.last-item {
  margin: 20px 0;
}
/* End: How To Section Styling */

/* Subscribe Section Styling */
#subscribe {
  padding: 150px 50px;
  text-align: center;
  border-bottom: 1px solid #e0e0e0;
}

#subscribe p {
  margin-top: 30px;
}

.subscribe-form {
  position: relative;
  margin-top: 5rem;
}

.form-input {
  border: none;
  height: 50px;
  outline: none;
  width: 40%;
  background-color: #f8f8f8;
  border-radius: 3.125rem;
  padding: 0 30px;
  padding-right: 210px;
/*   position: relative; */
  font-size: 18px;
}

.subscribe-btn {
  background: linear-gradient(to bottom, #d90647 10%, #eb402c 100%);
  border: none;
  box-shadow: 0 10px 30px rgba(223, 27, 60, 0.3);
  color: #ffffff;
  outline: none;
  padding: 15px 60px;
  position: absolute;
  margin-left: -200px;
}
.subscribe-btn:hover {
  background: linear-gradient(to bottom, #d90647 10%, #eb402c 100%);
  color: #ffffff;
}
/* End: Subscribe Section Styling */

/* Download The App Section Styling */
#download {
  text-align: center;
  padding: 100px;
}

#download * {
  margin: 25px auto;
}

.app-logo {
  -webkit-filter: drop-shadow(0 10px 30px rgba(223, 27, 60, 0.3));
  filter: drop-shadow(0 10px 30px rgba(223, 27, 60, 0.3));
}
/* End: Download The App Section Styling */

/* Footer Section Styling */
#footer {
  border-top: 1px solid #e0e0e0;
  display: flex;
  flex-flow: row;
  justify-content: space-between;
  padding: 20px 50px;
  color: #363636;
}

.links ul li {
  display: inline-block;
  margin: 10px 0;
  margin-right: 30px;
  font-size: 18px;
}

.links ul li:hover {
  background: linear-gradient(to bottom, #d90647 10%, #eb402c 100%);
  background-clip: border-box;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.links ul li a {
  color: #363636;
}
/* End: Footer Section Styling */

/* End: Main CSS Rules */

/* Extra small devices (portrait phones, less than 576px) */
@media (max-width: 575.98px) {
  body {
    font-size: 16px !important;
  }
  h1 {
    font-size: 36px;
  }

  h2 {
    font-size: 30px;
  }

  .row {
    max-width: 90%;
  }

  .btn {
    padding: 10px 20px;
    font-size: 16px;
  }

  section {
    padding: 20px;
  }

  .span_1_of_3 {
    width: 100% !important;
  }

  .span_1_of_2 {
    width: 100% !important;
  }

  ::placeholder {
    text-align: center;
  }

  #mobileNav {
    display: block;
  }

  #home {
    padding: 30px;
  }

  #hero {
    margin: 50px 0;
  }

  .logo {
    font-size: 1.875rem;
  }

  #navbar {
    display: none;
  }

  .hero-description {
    text-align: center;
    margin-top: 0.625rem;
    float: none;
    margin-left: 0;
  }
  .hero-description p {
    font-size: 16px;
    margin-bottom: 1.875rem;
  }
  .hero-img {
    display: none;
  }

  #features {
    padding-bottom: 50px;
  }

  .features-description {
    width: 100%;
  }

  .little-description {
    width: 100%;
  }

  .section-description {
    margin: 0;
  }

  .second-features-row {
    margin-top: 3.25rem;
    display: flex;
    flex-flow: column;
    flex-direction: column-reverse;
  }

  #testimonial .row {
    margin-top: 3.25rem;
  }

  #howto {
    height: 100%;
    margin-top: 0;
    padding: 50px 0;
  }

  #howto p {
    width: 80%;
    margin-left: 10%;
  }

  .item-icon1 {
    margin: 10px auto;
  }

  .item-icon2 {
    margin: 10px auto;
  }

  .third-col {
    margin-top: 30px;
  }

  .first-col .first-item,
  .last-item {
    display: flex;
    flex-flow: column;
    flex-direction: column-reverse;
    text-align: center;
  }

  .third-col .last-item {
    display: flex;
    flex-flow: column;
    flex-direction: column;
    text-align: center;
  }

  .big_image {
    display: block;
    position: static;
    height: auto;
    width: 100% !important;
    margin: 0 auto;
    margin-top: 50px;
  }

  .subscribe-form {
    margin-top: 2rem;
  }

  .subscribe-btn {
    position: static;
    margin-left: 0;
    margin-top: 20px;
  }

  #footer {
    border-top: 1px solid #e0e0e0;
    color: #363636;
    display: flex;
    flex-flow: column;
    justify-content: center;
    text-align: center;
  }
  .links ul li {
    text-align: center;
    display: inline-block;
    margin: 8px 0;
    margin-right: 20px;
    font-size: 16px;
  }

  .language-option {
    margin: 5px auto;
  }

  #testimonial .col {
    margin-bottom: 50px;
  }
  #download {
    padding: 50px 0;
  }
  #subscribe {
    padding: 100px 0;
  }

  .form-input {
    width: 80%;
    padding: 0 15px;
    padding-right: 15px;
    font-size: 16px;
    display: block;
    margin: auto;
  }
}

/* Small devices (landscape phones, 576px and up) */
@media (min-width: 576px) and (max-width: 767.98px) {
  body {
    font-size: 18px;
  }
  h1 {
    font-size: 50px;
  }

  h2 {
    font-size: 40px;
  }

  section {
    padding: 20px;
  }

  .span_1_of_3 {
    width: 100% !important;
  }

  .span_1_of_2 {
    width: 100% !important;
  }

  ::placeholder {
    text-align: center;
  }

  #mobileNav {
    display: block;
  }
  #navbar {
    display: none;
  }

  #hero {
    margin: 50px 0;
  }

  .logo {
    font-size: 1.875rem;
  }

  .hero-description {
    text-align: center;
    margin-top: 0.625rem;
    float: none;
    margin-left: 0;
  }
  .hero-description p {
    margin-bottom: 1.875rem;
  }
  .hero-img {
    display: none;
  }

  #features {
    padding-bottom: 50px;
  }

  .features-description {
    width: 100%;
  }

  .little-description {
    width: 100%;
  }

  .section-description {
    margin: 0;
  }

  .second-features-row {
    margin-top: 3.25rem;
    display: flex;
    flex-flow: column;
    flex-direction: column-reverse;
  }

  #testimonial .row {
    margin-top: 3.25rem;
  }

  #howto {
    height: 100%;
    margin-top: 0;
    padding: 50px 0;
  }

  #howto p {
    width: 80%;
    margin-left: 10%;
  }

  .item-icon1 {
    margin: 10px auto;
  }

  .item-icon2 {
    margin: 10px auto;
  }

  .third-col {
    margin-top: 30px;
  }

  .first-col .first-item,
  .last-item {
    display: flex;
    flex-flow: column;
    flex-direction: column-reverse;
    text-align: center;
  }

  .third-col .last-item {
    display: flex;
    flex-flow: column;
    flex-direction: column;
    text-align: center;
  }

  .big_image {
    display: block;
    position: static;
    height: auto;
    width: 100% !important;
    margin: 0 auto;
    margin-top: 50px;
  }

  .subscribe-form {
    margin-top: 2rem;
  }

  .subscribe-btn {
    position: static;
    margin-left: 0;
    margin-top: 20px;
  }

  #footer {
    border-top: 1px solid #e0e0e0;
    color: #363636;
    display: flex;
    flex-flow: column;
    justify-content: center;
    text-align: center;
  }
  .links ul li {
    text-align: center;
    display: inline-block;
    margin: 8px 0;
    margin-right: 20px;
    font-size: 18px;
  }

  .language-option {
    margin: 5px auto;
  }

  #testimonial .col {
    margin-bottom: 50px;
  }
  #download {
    padding: 50px 0;
  }
  #subscribe {
    padding: 100px 0;
  }

  .form-input {
    width: 60%;
    padding: 0 15px;
    padding-right: 15px;
    font-size: 18px;
    display: block;
    margin: auto;
  }
}

/* Medium devices (tablets, 768px and up) */
@media (min-width: 768px) and (max-width: 991.98px) {
  h1 {
    font-size: 50px;
  }

  h2 {
    font-size: 40px;
  }
  #howto h4 {
    font-size: 1.3rem;
    font-weight: 900;
  }

  .row {
    max-width: 90%;
  }

  .btn {
    padding: 10px 20px;
    font-size: 16px;
  }

  section {
    padding: 20px;
  }
  .btn {
    padding: 15px 30px;
  }
  #mobileNav {
    display: block;
    right: 5%;
  }
  #mobileNav span {
    font-size: 2.5rem;
  }
  #navbar {
    display: none;
  }
  .overlay-content a {
    font-size: 40px;
  }

  .hero-img {
    max-width: 45% !important;
    right: 0.375rem;
  }

  .section-description {
    margin-top: 150px;
  }

  .little-description {
    width: 100%;
  }

  #howto {
    height: 100%;
    margin-bottom: 5rem;
    margin-top: 0;
    margin-top: 10rem;
    padding: 50px 0;
    position: relative;
    width: 100%;
  }

  #howto #howto p {
    width: 80%;
    margin-left: 10%;
  }

  .item-icon1 {
    margin: 10px auto;
  }

  .item-icon2 {
    margin: 10px auto;
  }

  .first-col .first-item,
  .last-item {
    display: flex;
    flex-flow: column;
    flex-direction: column-reverse;
    text-align: center;
  }

  .third-col .last-item {
    display: flex;
    flex-flow: column;
    flex-direction: column;
    text-align: center;
  }

  .big_image {
    display: block;
    position: static;
    height: auto;
    width: 100% !important;
    margin: 0 auto;
    margin-top: 50px;
  }

  .subscribe-form {
    margin-top: 2rem;
  }

  .subscribe-btn {
    margin-left: -100px;
    position: absolute;
  }
  #subscribe {
    padding: 100px;
  }

  .form-input {
    width: 60%;
    padding: 0 30px;
    padding-right: 100px;
    font-size: 18px;
    margin: auto;
  }
}

/* Large devices (desktops, 992px and up) */
@media (min-width: 992px) and (max-width: 1199.98px) {
  h1 {
    font-size: 50px;
  }

  h2 {
    font-size: 40px;
  }
  #howto h4 {
    font-size: 1.3rem;
    font-weight: 900;
  }

  .row {
    max-width: 90%;
  }

  .btn {
    padding: 10px 20px;
    font-size: 16px;
  }

  section {
    padding: 20px;
  }
  .btn {
    padding: 15px 30px;
  }
  #mobileNav {
    display: block;
    right: 5%;
  }
  #mobileNav span {
    font-size: 2.5rem;
  }
  #navbar {
    display: none;
  }
  .overlay-content a {
    font-size: 40px;
  }

  .hero-img {
    max-width: 40% !important;
    right: 0.375rem;
  }

  .section-description {
    margin-top: 180px;
  }

  .little-description {
    width: 100%;
  }

  #howto {
    height: 100%;
    margin-bottom: 5rem;
    margin-top: 10rem;
    padding: 50px 0;
    position: relative;
    width: 100%;
  }

  #howto #howto p {
    width: 80%;
    margin-left: 10%;
  }

  .item-icon1 {
    margin: 10px auto;
  }

  .item-icon2 {
    margin: 10px auto;
  }

  .first-col .first-item,
  .last-item {
    display: flex;
    flex-flow: column;
    flex-direction: column-reverse;
    text-align: center;
  }

  .third-col .last-item {
    display: flex;
    flex-flow: column;
    flex-direction: column;
    text-align: center;
  }

  .big_image {
    display: block;
    position: static;
    height: auto;
    width: 100% !important;
    margin: 0 auto;
    margin-top: 0px;
  }

  .subscribe-form {
    margin-top: 2rem;
  }

  .subscribe-btn {
    margin-left: -100px;
    position: absolute;
  }
  #subscribe {
    padding: 100px;
  }

  .form-input {
    width: 50%;
    padding: 0 30px;
    padding-right: 100px;
    font-size: 18px;
    margin: auto;
  }
}

/* Extra large devices (large desktops, 1200px and up) */
@media (min-width: 1200px) {
  .little-description {
    margin-top: 1.875rem;
    font-size: 1.125rem;
    width: 100%;
  }
  #subscribe {
    padding: 100px;
  }

  #howto {
    margin-bottom: 5rem;
    margin-top: 10rem;
    padding: 50px 0;
    position: relative;
    width: 100%;
    height: 422px;
  }

  .big_image {
    max-width: 350px;
    margin-top: -135px;
  }
}
    /* Grid CSS */
.section {
  clear: both;
  padding: 0;
  margin: 0;
}
.row:after,
.row:before {
  content: "";
  display: table;
}
.row:after {
  clear: both;
}
.row {
  zoom: 1;
}
.col {
  display: block;
  float: left;
  margin: 1% 0 1% 1.6%;
}
.col:first-child {
  margin-left: 0;
}
@media only screen and (max-width: 480px) {
  .col {
    margin: 1% 0 1% 0;
  }
}
.span_2_of_2 {
  width: 100%;
}
.span_1_of_2 {
  width: 49.2%;
}
@media only screen and (max-width: 480px) {
  .span_2_of_2 {
    width: 100%;
  }
  .span_1_of_2 {
    width: 100%;
  }
}
.span_3_of_3 {
  width: 100%;
}
.span_2_of_3 {
  width: 66.13%;
}
.span_1_of_3 {
  width: 32.26%;
}
@media only screen and (max-width: 480px) {
  .span_3_of_3 {
    width: 100%;
  }
  .span_2_of_3 {
    width: 100%;
  }
  .span_1_of_3 {
    width: 100%;
  }
}
.span_4_of_4 {
  width: 100%;
}
.span_3_of_4 {
  width: 74.6%;
}
.span_2_of_4 {
  width: 49.2%;
}
.span_1_of_4 {
  width: 23.8%;
}
@media only screen and (max-width: 480px) {
  .span_4_of_4 {
    width: 100%;
  }
  .span_3_of_4 {
    width: 100%;
  }
  .span_2_of_4 {
    width: 100%;
  }
  .span_1_of_4 {
    width: 100%;
  }
}
.span_5_of_5 {
  width: 100%;
}
.span_4_of_5 {
  width: 79.68%;
}
.span_3_of_5 {
  width: 59.36%;
}
.span_2_of_5 {
  width: 39.04%;
}
.span_1_of_5 {
  width: 18.72%;
}
@media only screen and (max-width: 480px) {
  .span_5_of_5 {
    width: 100%;
  }
  .span_4_of_5 {
    width: 100%;
  }
  .span_3_of_5 {
    width: 100%;
  }
  .span_2_of_5 {
    width: 100%;
  }
  .span_1_of_5 {
    width: 100%;
  }
}
.span_6_of_6 {
  width: 100%;
}
.span_5_of_6 {
  width: 83.06%;
}
.span_4_of_6 {
  width: 66.13%;
}
.span_3_of_6 {
  width: 49.2%;
}
.span_2_of_6 {
  width: 32.26%;
}
.span_1_of_6 {
  width: 15.33%;
}
@media only screen and (max-width: 480px) {
  .span_6_of_6 {
    width: 100%;
  }
  .span_5_of_6 {
    width: 100%;
  }
  .span_4_of_6 {
    width: 100%;
  }
  .span_3_of_6 {
    width: 100%;
  }
  .span_2_of_6 {
    width: 100%;
  }
  .span_1_of_6 {
    width: 100%;
  }
}
.span_7_of_7 {
  width: 100%;
}
.span_6_of_7 {
  width: 85.48%;
}
.span_5_of_7 {
  width: 70.97%;
}
.span_4_of_7 {
  width: 56.45%;
}
.span_3_of_7 {
  width: 41.94%;
}
.span_2_of_7 {
  width: 27.42%;
}
.span_1_of_7 {
  width: 12.91%;
}
@media only screen and (max-width: 480px) {
  .span_7_of_7 {
    width: 100%;
  }
  .span_6_of_7 {
    width: 100%;
  }
  .span_5_of_7 {
    width: 100%;
  }
  .span_4_of_7 {
    width: 100%;
  }
  .span_3_of_7 {
    width: 100%;
  }
  .span_2_of_7 {
    width: 100%;
  }
  .span_1_of_7 {
    width: 100%;
  }
}
.span_8_of_8 {
  width: 100%;
}
.span_7_of_8 {
  width: 87.3%;
}
.span_6_of_8 {
  width: 74.6%;
}
.span_5_of_8 {
  width: 61.9%;
}
.span_4_of_8 {
  width: 49.2%;
}
.span_3_of_8 {
  width: 36.5%;
}
.span_2_of_8 {
  width: 23.8%;
}
.span_1_of_8 {
  width: 11.1%;
}
@media only screen and (max-width: 480px) {
  .span_8_of_8 {
    width: 100%;
  }
  .span_7_of_8 {
    width: 100%;
  }
  .span_6_of_8 {
    width: 100%;
  }
  .span_5_of_8 {
    width: 100%;
  }
  .span_4_of_8 {
    width: 100%;
  }
  .span_3_of_8 {
    width: 100%;
  }
  .span_2_of_8 {
    width: 100%;
  }
  .span_1_of_8 {
    width: 100%;
  }
}
.span_9_of_9 {
  width: 100%;
}
.span_8_of_9 {
  width: 88.71%;
}
.span_7_of_9 {
  width: 77.42%;
}
.span_6_of_9 {
  width: 66.13%;
}
.span_5_of_9 {
  width: 54.84%;
}
.span_4_of_9 {
  width: 43.55%;
}
.span_3_of_9 {
  width: 32.26%;
}
.span_2_of_9 {
  width: 20.97%;
}
.span_1_of_9 {
  width: 9.68%;
}
@media only screen and (max-width: 480px) {
  .span_9_of_9 {
    width: 100%;
  }
  .span_8_of_9 {
    width: 100%;
  }
  .span_7_of_9 {
    width: 100%;
  }
  .span_6_of_9 {
    width: 100%;
  }
  .span_5_of_9 {
    width: 100%;
  }
  .span_4_of_9 {
    width: 100%;
  }
  .span_3_of_9 {
    width: 100%;
  }
  .span_2_of_9 {
    width: 100%;
  }
  .span_1_of_9 {
    width: 100%;
  }
}
.span_10_of_10 {
  width: 100%;
}
.span_9_of_10 {
  width: 89.84%;
}
.span_8_of_10 {
  width: 79.68%;
}
.span_7_of_10 {
  width: 69.52%;
}
.span_6_of_10 {
  width: 59.36%;
}
.span_5_of_10 {
  width: 49.2%;
}
.span_4_of_10 {
  width: 39.04%;
}
.span_3_of_10 {
  width: 28.88%;
}
.span_2_of_10 {
  width: 18.72%;
}
.span_1_of_10 {
  width: 8.56%;
}
@media only screen and (max-width: 480px) {
  .span_10_of_10 {
    width: 100%;
  }
  .span_9_of_10 {
    width: 100%;
  }
  .span_8_of_10 {
    width: 100%;
  }
  .span_7_of_10 {
    width: 100%;
  }
  .span_6_of_10 {
    width: 100%;
  }
  .span_5_of_10 {
    width: 100%;
  }
  .span_4_of_10 {
    width: 100%;
  }
  .span_3_of_10 {
    width: 100%;
  }
  .span_2_of_10 {
    width: 100%;
  }
  .span_1_of_10 {
    width: 100%;
  }
}
.span_11_of_11 {
  width: 100%;
}
.span_10_of_11 {
  width: 90.76%;
}
.span_9_of_11 {
  width: 81.52%;
}
.span_8_of_11 {
  width: 72.29%;
}
.span_7_of_11 {
  width: 63.05%;
}
.span_6_of_11 {
  width: 53.81%;
}
.span_5_of_11 {
  width: 44.58%;
}
.span_4_of_11 {
  width: 35.34%;
}
.span_3_of_11 {
  width: 26.1%;
}
.span_2_of_11 {
  width: 16.87%;
}
.span_1_of_11 {
  width: 7.63%;
}
@media only screen and (max-width: 480px) {
  .span_11_of_11 {
    width: 100%;
  }
  .span_10_of_11 {
    width: 100%;
  }
  .span_9_of_11 {
    width: 100%;
  }
  .span_8_of_11 {
    width: 100%;
  }
  .span_7_of_11 {
    width: 100%;
  }
  .span_6_of_11 {
    width: 100%;
  }
  .span_5_of_11 {
    width: 100%;
  }
  .span_4_of_11 {
    width: 100%;
  }
  .span_3_of_11 {
    width: 100%;
  }
  .span_2_of_11 {
    width: 100%;
  }
  .span_1_of_11 {
    width: 100%;
  }
}
.span_12_of_12 {
  width: 100%;
}
.span_11_of_12 {
  width: 91.53%;
}
.span_10_of_12 {
  width: 83.06%;
}
.span_9_of_12 {
  width: 74.6%;
}
.span_8_of_12 {
  width: 66.13%;
}
.span_7_of_12 {
  width: 57.66%;
}
.span_6_of_12 {
  width: 49.2%;
}
.span_5_of_12 {
  width: 40.73%;
}
.span_4_of_12 {
  width: 32.26%;
}
.span_3_of_12 {
  width: 23.8%;
}
.span_2_of_12 {
  width: 15.33%;
}
.span_1_of_12 {
  width: 6.86%;
}
@media only screen and (max-width: 480px) {
  .span_12_of_12 {
    width: 100%;
  }
  .span_11_of_12 {
    width: 100%;
  }
  .span_10_of_12 {
    width: 100%;
  }
  .span_9_of_12 {
    width: 100%;
  }
  .span_8_of_12 {
    width: 100%;
  }
  .span_7_of_12 {
    width: 100%;
  }
  .span_6_of_12 {
    width: 100%;
  }
  .span_5_of_12 {
    width: 100%;
  }
  .span_4_of_12 {
    width: 100%;
  }
  .span_3_of_12 {
    width: 100%;
  }
  .span_2_of_12 {
    width: 100%;
  }
  .span_1_of_12 {
    width: 100%;
  }
}
    
    </style>


 <!-- Favicon -->

    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="images/favicon/apple-touch-icon.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="images/favicon/favicon-32x32.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="images/favicon/favicon-16x16.png"
    />
    <link rel="manifest" href="images/favicon/site.webmanifest" />
    <link
      rel="mask-icon"
      href="images/favicon/safari-pinned-tab.svg"
      color="#5bbad5"
    />
    <link rel="shortcut icon" href="images/favicon/favicon.ico" />
    <meta name="msapplication-TileColor" content="#da532c" />
    <meta
      name="msapplication-config"
      content="images/favicon/browserconfig.xml"
    />
    <meta name="theme-color" content="#ffffff" />

    <!-- End: Favicon -->

    <!-- Required Social Preview MetaTags -->

    <!-- Primary Meta Tags -->
    <meta name="title" content="HeyU Landing Page — #2 PSD To HTML Coversion" />
    <meta
      name="description"
      content="HeyU is an open source single page App Landing page website PSD to HTML template. This is my #2 PSD To HTML Conversion. Best of Luck To Me ☻"
    />

    <!-- Open Graph / Facebook -->
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://alnahian2003.github.io/heyu" />
    <meta
      property="og:title"
      content="HeyU Landing Page — #2 PSD To HTML Coversion"
    />
    <meta
      property="og:description"
      content="HeyU is an open source single page App Landing page website PSD to HTML template. This is my #2 PSD To HTML Conversion. Best of Luck To Me ☻"
    />
    <meta property="og:image" content="images/preview.png" />

    <!-- Twitter -->
    <meta property="twitter:card" content="summary_large_image" />
    <meta
      property="twitter:url"
      content="https://alnahian2003.github.io/heyu"
    />
    <meta
      property="twitter:title"
      content="HeyU Landing Page — #2 PSD To HTML Coversion"
    />
    <meta
      property="twitter:description"
      content="HeyU is an open source single page App Landing page website PSD to HTML template. This is my #2 PSD To HTML Conversion. Best of Luck To Me ☻"
    />
    <meta property="twitter:image" content="images/preview.png" />

    <!-- End of Required Social Preview MetaTags -->

    <!-- LATO — Google Font -->
    <link
      href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;0,900;1,400&display=swap"
      rel="stylesheet"
    />
    <!-- End: LATO — Google Font -->

 
  </head>
  <body>
    <!-- Preloader -->
    <div class="preloader">
      <div class="loader"></div>
    </div>
    <!-- Preloader End -->
    <!-- Header Section -->
    <header id="home">
      <nav>
        <div class="navbar-logo">
          <a href="#" class="logo">ChatApp</a>
        </div>
        <div id="navbar">
          <ul>
            <li><a href="welcome.jsp">Home</a></li>
            <li><a href="welcome.jsp">Features</a></li>
          

            <li><a href="UserI">Register</a></li>
             <li><a href="Login">Login</a></li>
            
          </ul>
        </div>
        <div id="mobileNav">
          <span onclick="openNav()">&#9776;</span>
        </div>
        <div id="myNav" class="mobileNavOverlay">
          <div class="overlay-content">
            <a href="javascript:void()" class="close-btn" onclick="closeNav()"
              >&times;</a
            >
            <a href="#home" onclick="closeNav()">Home</a>
            <a href="#features" onclick="closeNav()">Features</a>
            
       
            <a href="UserI" onclick="closeNav()">Register</a>
            <a href="Login">Login</a>
          </div>
        </div>
      </nav>
      <div id="hero">
        <div class="row">
          <div class="col span_1_of_2">
           
          </div>
          
        </div>
      </div>
      
     

    </header>
 
    <section id="features">
               
	<div class="login-box">
        <h2 style="font:20px;">Connexion</h2>
        <p>${ !empty msg ? msg : '' }</p>
	<form action="/WebChat/Login" method="post">
            <div class="user-box">
                <input  type="text" name="email" id="email">
                <label>Email</label>
            </div>
            <div class="user-box">
                <input type="password" name="pwd" id="pwd" >
                <label  for="pwd">Mot de passe</label>
            </div>
            <button name="login_btn" type="submit">
            <span></span>
                <span></span>
                <span></span>
               
                S'authentifier
            </button>
            
               
          
        </form>
    </div>
</section>
      
      
      
    
 

   


    <!-- Required JavaScript Files & CDN -->
    <!-- JQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Main JS Files -->
    <script >
    /**
    * @preserve HTML5 Shiv 3.7.3 | @afarkas @jdalton @jon_neal @rem | MIT/GPL2 Licensed
    */
    !function(a,b){function c(a,b){var c=a.createElement("p"),d=a.getElementsByTagName("head")[0]||a.documentElement;return c.innerHTML="x<style>"+b+"</style>",d.insertBefore(c.lastChild,d.firstChild)}function d(){var a=t.elements;return"string"==typeof a?a.split(" "):a}function e(a,b){var c=t.elements;"string"!=typeof c&&(c=c.join(" ")),"string"!=typeof a&&(a=a.join(" ")),t.elements=c+" "+a,j(b)}function f(a){var b=s[a[q]];return b||(b={},r++,a[q]=r,s[r]=b),b}function g(a,c,d){if(c||(c=b),l)return c.createElement(a);d||(d=f(c));var e;return e=d.cache[a]?d.cache[a].cloneNode():p.test(a)?(d.cache[a]=d.createElem(a)).cloneNode():d.createElem(a),!e.canHaveChildren||o.test(a)||e.tagUrn?e:d.frag.appendChild(e)}function h(a,c){if(a||(a=b),l)return a.createDocumentFragment();c=c||f(a);for(var e=c.frag.cloneNode(),g=0,h=d(),i=h.length;i>g;g++)e.createElement(h[g]);return e}function i(a,b){b.cache||(b.cache={},b.createElem=a.createElement,b.createFrag=a.createDocumentFragment,b.frag=b.createFrag()),a.createElement=function(c){return t.shivMethods?g(c,a,b):b.createElem(c)},a.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+d().join().replace(/[\w\-:]+/g,function(a){return b.createElem(a),b.frag.createElement(a),'c("'+a+'")'})+");return n}")(t,b.frag)}function j(a){a||(a=b);var d=f(a);return!t.shivCSS||k||d.hasCSS||(d.hasCSS=!!c(a,"article,aside,dialog,figcaption,figure,footer,header,hgroup,main,nav,section{display:block}mark{background:#FF0;color:#000}template{display:none}")),l||i(a,d),a}var k,l,m="3.7.3",n=a.html5||{},o=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,p=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,q="_html5shiv",r=0,s={};!function(){try{var a=b.createElement("a");a.innerHTML="<xyz></xyz>",k="hidden"in a,l=1==a.childNodes.length||function(){b.createElement("a");var a=b.createDocumentFragment();return"undefined"==typeof a.cloneNode||"undefined"==typeof a.createDocumentFragment||"undefined"==typeof a.createElement}()}catch(c){k=!0,l=!0}}();var t={elements:n.elements||"abbr article aside audio bdi canvas data datalist details dialog figcaption figure footer header hgroup main mark meter nav output picture progress section summary template time video",version:m,shivCSS:n.shivCSS!==!1,supportsUnknownElements:l,shivMethods:n.shivMethods!==!1,type:"default",shivDocument:j,createElement:g,createDocumentFragment:h,addElements:e};a.html5=t,j(b),"object"==typeof module&&module.exports&&(module.exports=t)}("undefined"!=typeof window?window:this,document);

    /*! Respond.js v1.4.2: min/max-width media query polyfill
     * Copyright 2014 Scott Jehl
     * Licensed under MIT
     * https://j.mp/respondjs */

    !function(a){"use strict";a.matchMedia=a.matchMedia||function(a){var b,c=a.documentElement,d=c.firstElementChild||c.firstChild,e=a.createElement("body"),f=a.createElement("div");return f.id="mq-test-1",f.style.cssText="position:absolute;top:-100em",e.style.background="none",e.appendChild(f),function(a){return f.innerHTML='&shy;<style media="'+a+'"> #mq-test-1 { width: 42px; }</style>',c.insertBefore(e,d),b=42===f.offsetWidth,c.removeChild(e),{matches:b,media:a}}}(a.document)}(this),function(a){"use strict";function b(){v(!0)}var c={};a.respond=c,c.update=function(){};var d=[],e=function(){var b=!1;try{b=new a.XMLHttpRequest}catch(c){b=new a.ActiveXObject("Microsoft.XMLHTTP")}return function(){return b}}(),f=function(a,b){var c=e();c&&(c.open("GET",a,!0),c.onreadystatechange=function(){4!==c.readyState||200!==c.status&&304!==c.status||b(c.responseText)},4!==c.readyState&&c.send(null))},g=function(a){return a.replace(c.regex.minmaxwh,"").match(c.regex.other)};if(c.ajax=f,c.queue=d,c.unsupportedmq=g,c.regex={media:/@media[^\{]+\{([^\{\}]*\{[^\}\{]*\})+/gi,keyframes:/@(?:\-(?:o|moz|webkit)\-)?keyframes[^\{]+\{(?:[^\{\}]*\{[^\}\{]*\})+[^\}]*\}/gi,comments:/\/\*[^*]*\*+([^/][^*]*\*+)*\//gi,urls:/(url\()['"]?([^\/\)'"][^:\)'"]+)['"]?(\))/g,findStyles:/@media *([^\{]+)\{([\S\s]+?)$/,only:/(only\s+)?([a-zA-Z]+)\s?/,minw:/\(\s*min\-width\s*:\s*(\s*[0-9\.]+)(px|em)\s*\)/,maxw:/\(\s*max\-width\s*:\s*(\s*[0-9\.]+)(px|em)\s*\)/,minmaxwh:/\(\s*m(in|ax)\-(height|width)\s*:\s*(\s*[0-9\.]+)(px|em)\s*\)/gi,other:/\([^\)]*\)/g},c.mediaQueriesSupported=a.matchMedia&&null!==a.matchMedia("only all")&&a.matchMedia("only all").matches,!c.mediaQueriesSupported){var h,i,j,k=a.document,l=k.documentElement,m=[],n=[],o=[],p={},q=30,r=k.getElementsByTagName("head")[0]||l,s=k.getElementsByTagName("base")[0],t=r.getElementsByTagName("link"),u=function(){var a,b=k.createElement("div"),c=k.body,d=l.style.fontSize,e=c&&c.style.fontSize,f=!1;return b.style.cssText="position:absolute;font-size:1em;width:1em",c||(c=f=k.createElement("body"),c.style.background="none"),l.style.fontSize="100%",c.style.fontSize="100%",c.appendChild(b),f&&l.insertBefore(c,l.firstChild),a=b.offsetWidth,f?l.removeChild(c):c.removeChild(b),l.style.fontSize=d,e&&(c.style.fontSize=e),a=j=parseFloat(a)},v=function(b){var c="clientWidth",d=l[c],e="CSS1Compat"===k.compatMode&&d||k.body[c]||d,f={},g=t[t.length-1],p=(new Date).getTime();if(b&&h&&q>p-h)return a.clearTimeout(i),i=a.setTimeout(v,q),void 0;h=p;for(var s in m)if(m.hasOwnProperty(s)){var w=m[s],x=w.minw,y=w.maxw,z=null===x,A=null===y,B="em";x&&(x=parseFloat(x)*(x.indexOf(B)>-1?j||u():1)),y&&(y=parseFloat(y)*(y.indexOf(B)>-1?j||u():1)),w.hasquery&&(z&&A||!(z||e>=x)||!(A||y>=e))||(f[w.media]||(f[w.media]=[]),f[w.media].push(n[w.rules]))}for(var C in o)o.hasOwnProperty(C)&&o[C]&&o[C].parentNode===r&&r.removeChild(o[C]);o.length=0;for(var D in f)if(f.hasOwnProperty(D)){var E=k.createElement("style"),F=f[D].join("\n");E.type="text/css",E.media=D,r.insertBefore(E,g.nextSibling),E.styleSheet?E.styleSheet.cssText=F:E.appendChild(k.createTextNode(F)),o.push(E)}},w=function(a,b,d){var e=a.replace(c.regex.comments,"").replace(c.regex.keyframes,"").match(c.regex.media),f=e&&e.length||0;b=b.substring(0,b.lastIndexOf("/"));var h=function(a){return a.replace(c.regex.urls,"$1"+b+"$2$3")},i=!f&&d;b.length&&(b+="/"),i&&(f=1);for(var j=0;f>j;j++){var k,l,o,p;i?(k=d,n.push(h(a))):(k=e[j].match(c.regex.findStyles)&&RegExp.$1,n.push(RegExp.$2&&h(RegExp.$2))),o=k.split(","),p=o.length;for(var q=0;p>q;q++)l=o[q],g(l)||m.push({media:l.split("(")[0].match(c.regex.only)&&RegExp.$2||"all",rules:n.length-1,hasquery:l.indexOf("(")>-1,minw:l.match(c.regex.minw)&&parseFloat(RegExp.$1)+(RegExp.$2||""),maxw:l.match(c.regex.maxw)&&parseFloat(RegExp.$1)+(RegExp.$2||"")})}v()},x=function(){if(d.length){var b=d.shift();f(b.href,function(c){w(c,b.href,b.media),p[b.href]=!0,a.setTimeout(function(){x()},0)})}},y=function(){for(var b=0;b<t.length;b++){var c=t[b],e=c.href,f=c.media,g=c.rel&&"stylesheet"===c.rel.toLowerCase();e&&g&&!p[e]&&(c.styleSheet&&c.styleSheet.rawCssText?(w(c.styleSheet.rawCssText,e,f),p[e]=!0):(!/^([a-zA-Z:]*\/\/)/.test(e)&&!s||e.replace(RegExp.$1,"").split("/")[0]===a.location.host)&&("//"===e.substring(0,2)&&(e=a.location.protocol+e),d.push({href:e,media:f})))}x()};y(),c.update=y,c.getEmValue=u,a.addEventListener?a.addEventListener("resize",b,!1):a.attachEvent&&a.attachEvent("onresize",b)}}(this);


    /*!
     * selectivizr v1.0.2 - (c) Keith Clark, freely distributable under the terms of the MIT license.
     * selectivizr.com
     */
    (function(j){function A(a){return a.replace(B,h).replace(C,function(a,d,b){for(var a=b.split(","),b=0,e=a.length;b<e;b++){var s=D(a[b].replace(E,h).replace(F,h))+o,l=[];a[b]=s.replace(G,function(a,b,c,d,e){if(b){if(l.length>0){var a=l,f,e=s.substring(0,e).replace(H,i);if(e==i||e.charAt(e.length-1)==o)e+="*";try{f=t(e)}catch(k){}if(f){e=0;for(c=f.length;e<c;e++){for(var d=f[e],h=d.className,j=0,m=a.length;j<m;j++){var g=a[j];if(!RegExp("(^|\\s)"+g.className+"(\\s|$)").test(d.className)&&g.b&&(g.b===!0||g.b(d)===!0))h=u(h,g.className,!0)}d.className=h}}l=[]}return b}else{if(b=c?I(c):!v||v.test(d)?{className:w(d),b:!0}:null)return l.push(b),"."+b.className;return a}})}return d+a.join(",")})}function I(a){var c=!0,d=w(a.slice(1)),b=a.substring(0,5)==":not(",e,f;b&&(a=a.slice(5,-1));var l=a.indexOf("(");l>-1&&(a=a.substring(0,l));if(a.charAt(0)==":")switch(a.slice(1)){case "root":c=function(a){return b?a!=p:a==p};break;case "target":if(m==8){c=function(a){function c(){var d=location.hash,e=d.slice(1);return b?d==i||a.id!=e:d!=i&&a.id==e}k(j,"hashchange",function(){g(a,d,c())});return c()};break}return!1;case "checked":c=function(a){J.test(a.type)&&k(a,"propertychange",function(){event.propertyName=="checked"&&g(a,d,a.checked!==b)});return a.checked!==b};break;case "disabled":b=!b;case "enabled":c=function(c){if(K.test(c.tagName))return k(c,"propertychange",function(){event.propertyName=="$disabled"&&g(c,d,c.a===b)}),q.push(c),c.a=c.disabled,c.disabled===b;return a==":enabled"?b:!b};break;case "focus":e="focus",f="blur";case "hover":e||(e="mouseenter",f="mouseleave");c=function(a){k(a,b?f:e,function(){g(a,d,!0)});k(a,b?e:f,function(){g(a,d,!1)});return b};break;default:if(!L.test(a))return!1}return{className:d,b:c}}function w(a){return M+"-"+(m==6&&N?O++:a.replace(P,function(a){return a.charCodeAt(0)}))}function D(a){return a.replace(x,h).replace(Q,o)}function g(a,c,d){var b=a.className,c=u(b,c,d);if(c!=b)a.className=c,a.parentNode.className+=i}function u(a,c,d){var b=RegExp("(^|\\s)"+c+"(\\s|$)"),e=b.test(a);return d?e?a:a+o+c:e?a.replace(b,h).replace(x,h):a}function k(a,c,d){a.attachEvent("on"+c,d)}function r(a,c){if(/^https?:\/\//i.test(a))return c.substring(0,c.indexOf("/",8))==a.substring(0,a.indexOf("/",8))?a:null;if(a.charAt(0)=="/")return c.substring(0,c.indexOf("/",8))+a;var d=c.split(/[?#]/)[0];a.charAt(0)!="?"&&d.charAt(d.length-1)!="/"&&(d=d.substring(0,d.lastIndexOf("/")+1));return d+a}function y(a){if(a)return n.open("GET",a,!1),n.send(),(n.status==200?n.responseText:i).replace(R,i).replace(S,function(c,d,b,e,f){return y(r(b||f,a))}).replace(T,function(c,d,b){d=d||i;return" url("+d+r(b,a)+d+") "});return i}function U(){var a,c;a=f.getElementsByTagName("BASE");for(var d=a.length>0?a[0].href:f.location.href,b=0;b<f.styleSheets.length;b++)if(c=f.styleSheets[b],c.href!=i&&(a=r(c.href,d)))c.cssText=A(y(a));q.length>0&&setInterval(function(){for(var a=0,c=q.length;a<c;a++){var b=q[a];if(b.disabled!==b.a)b.disabled?(b.disabled=!1,b.a=!0,b.disabled=!0):b.a=b.disabled}},250)}if(!/*@cc_on!@*/true){var f=document,p=f.documentElement,n=function(){if(j.XMLHttpRequest)return new XMLHttpRequest;try{return new ActiveXObject("Microsoft.XMLHTTP")}catch(a){return null}}(),m=/MSIE (\d+)/.exec(navigator.userAgent)[1];if(!(f.compatMode!="CSS1Compat"||m<6||m>8||!n)){var z={NW:"*.Dom.select",MooTools:"$$",DOMAssistant:"*.$",Prototype:"$$",YAHOO:"*.util.Selector.query",Sizzle:"*",jQuery:"*",dojo:"*.query"},t,q=[],O=0,N=!0,M="slvzr",R=/(\/\*[^*]*\*+([^\/][^*]*\*+)*\/)\s*/g,S=/@import\s*(?:(?:(?:url\(\s*(['"]?)(.*)\1)\s*\))|(?:(['"])(.*)\3))[^;]*;/g,T=/\burl\(\s*(["']?)(?!data:)([^"')]+)\1\s*\)/g,L=/^:(empty|(first|last|only|nth(-last)?)-(child|of-type))$/,B=/:(:first-(?:line|letter))/g,C=/(^|})\s*([^\{]*?[\[:][^{]+)/g,G=/([ +~>])|(:[a-z-]+(?:\(.*?\)+)?)|(\[.*?\])/g,H=/(:not\()?:(hover|enabled|disabled|focus|checked|target|active|visited|first-line|first-letter)\)?/g,P=/[^\w-]/g,K=/^(INPUT|SELECT|TEXTAREA|BUTTON)$/,J=/^(checkbox|radio)$/,v=m>6?/[\$\^*]=(['"])\1/:null,E=/([(\[+~])\s+/g,F=/\s+([)\]+~])/g,Q=/\s+/g,x=/^\s*((?:[\S\s]*\S)?)\s*$/,i="",o=" ",h="$1";(function(a,c){function d(){try{p.doScroll("left")}catch(a){setTimeout(d,50);return}b("poll")}function b(d){if(!(d.type=="readystatechange"&&f.readyState!="complete")&&((d.type=="load"?a:f).detachEvent("on"+d.type,b,!1),!e&&(e=!0)))c.call(a,d.type||d)}var e=!1,g=!0;if(f.readyState=="complete")c.call(a,i);else{if(f.createEventObject&&p.doScroll){try{g=!a.frameElement}catch(h){}g&&d()}k(f,"readystatechange",b);k(a,"load",b)}})(j,function(){for(var a in z){var c,d,b=j;if(j[a]){for(c=z[a].replace("*",a).split(".");(d=c.shift())&&(b=b[d]););if(typeof b=="function"){t=b;U();break}}}})}}})(this);
    
    
    </script>
    <script src="js/jquery.nice-select.min.js">
    /*  jQuery Nice Select - v1.0
    https://github.com/hernansartorio/jquery-nice-select
    Made by Hernán Sartorio  */
!function(e){e.fn.niceSelect=function(t){function s(t){t.after(e("<div></div>").addClass("nice-select").addClass(t.attr("class")||"").addClass(t.attr("disabled")?"disabled":"").attr("tabindex",t.attr("disabled")?null:"0").html('<span class="current"></span><ul class="list"></ul>'));var s=t.next(),n=t.find("option"),i=t.find("option:selected");s.find(".current").html(i.data("display")||i.text()),n.each(function(t){var n=e(this),i=n.data("display");s.find("ul").append(e("<li></li>").attr("data-value",n.val()).attr("data-display",i||null).addClass("option"+(n.is(":selected")?" selected":"")+(n.is(":disabled")?" disabled":"")).html(n.text()))})}if("string"==typeof t)return"update"==t?this.each(function(){var t=e(this),n=e(this).next(".nice-select"),i=n.hasClass("open");n.length&&(n.remove(),s(t),i&&t.next().trigger("click"))}):"destroy"==t?(this.each(function(){var t=e(this),s=e(this).next(".nice-select");s.length&&(s.remove(),t.css("display",""))}),0==e(".nice-select").length&&e(document).off(".nice_select")):console.log('Method "'+t+'" does not exist.'),this;this.hide(),this.each(function(){var t=e(this);t.next().hasClass("nice-select")||s(t)}),e(document).off(".nice_select"),e(document).on("click.nice_select",".nice-select",function(t){var s=e(this);e(".nice-select").not(s).removeClass("open"),s.toggleClass("open"),s.hasClass("open")?(s.find(".option"),s.find(".focus").removeClass("focus"),s.find(".selected").addClass("focus")):s.focus()}),e(document).on("click.nice_select",function(t){0===e(t.target).closest(".nice-select").length&&e(".nice-select").removeClass("open").find(".option")}),e(document).on("click.nice_select",".nice-select .option:not(.disabled)",function(t){var s=e(this),n=s.closest(".nice-select");n.find(".selected").removeClass("selected"),s.addClass("selected");var i=s.data("display")||s.text();n.find(".current").text(i),n.prev("select").val(s.data("value")).trigger("change")}),e(document).on("keydown.nice_select",".nice-select",function(t){var s=e(this),n=e(s.find(".focus")||s.find(".list .option.selected"));if(32==t.keyCode||13==t.keyCode)return s.hasClass("open")?n.trigger("click"):s.trigger("click"),!1;if(40==t.keyCode){if(s.hasClass("open")){var i=n.nextAll(".option:not(.disabled)").first();i.length>0&&(s.find(".focus").removeClass("focus"),i.addClass("focus"))}else s.trigger("click");return!1}if(38==t.keyCode){if(s.hasClass("open")){var l=n.prevAll(".option:not(.disabled)").first();l.length>0&&(s.find(".focus").removeClass("focus"),l.addClass("focus"))}else s.trigger("click");return!1}if(27==t.keyCode)s.hasClass("open")&&s.trigger("click");else if(9==t.keyCode&&s.hasClass("open"))return!1});var n=document.createElement("a").style;return n.cssText="pointer-events:auto","auto"!==n.pointerEvents&&e("html").addClass("no-csspointerevents"),this}}(jQuery);
    
    </script>
    <script >
  //Get the button:
    mybutton = document.getElementById("scrollUp");

    function scrollFunction() {
      if (
        document.body.scrollTop > sticky ||
        document.documentElement.scrollTop > sticky
      ) {
        mybutton.style.display = "block";
      } else {
        mybutton.style.display = "none";
      }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
      document.body.scrollTop = 0; // For Safari
      document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }

    // Functional Sticky Navbar
    window.onscroll = function () {
      myFunction();
      scrollFunction();
    };

    var navbar = document.querySelector("nav");
    var services = document.querySelector("#features");
    var sticky = services.offsetTop;

    function myFunction() {
      if (window.pageYOffset > sticky) {
        navbar.classList.add("sticky");
      } else {
        navbar.classList.remove("sticky");
      }
    }

    $(document).ready(function () {
      // Preloader
      document.querySelector(".preloader").classList.add("opacity-0");
      setTimeout(function () {
        document.querySelector(".preloader").style.display = "none";
      }, 1000);

      //   Nice Select Initialization
      $("select").niceSelect();
    });

    // Navbar Open Function on Mobile Menu
    function openNav() {
      $("#myNav").css("width", "100%");
    }

    // Navbar Close Function on Mobile Menu
    function closeNav() {
      $("#myNav").css("width", "0");
    }

    </script>
  </body>
</html>




<body>
<p align="center"><a href="https://symfony.com" target="_blank">
    <img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a405bc87-58fc-471b-8a07-f1ad1fb1fb52/Aadir_un_poco_de_texto.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221211T182935Z&X-Amz-Expires=86400&X-Amz-Signature=6f9a25b5edace6250eeaa4d9de75b7abe55a2caa87cfadff9cd2b1c2da32d348&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22A%25C3%25B1adir%2520un%2520poco%2520de%2520texto.png%22&x-id=GetObject">
</a></p>

#### Overview
Just Up MQL Framework is an open-source Metaquotes Language framework managed by Jonathan Fernandez, Just Up Corporation CEO as main collaborator.

<b>Colaborate<b>
If you want to colaborate with the project, feel free to reach us at [framework@justup.us](mailto:framework@justup.us "framework@justup.us")

#### Installation
<ol>
<li>Download or clone the repository to your computer. </li>
<li>Copy the files into a folder with the name *JustUp-MQL-Framework* in your MQL4/5 base folder</li>
<li>Place the code line below in your scrip/ea main file header</li>

```cpp
#include <../JustUp-MQL-Framework/Main.mqh>
```

<p>If you are using it in an Expert Advisor, follow the next steps.<br>
<b>Warning</b> Do not do this steps if you are using it in a script or indicator.</p>
<li>Place <b>FrameworkInit();</b> at the beginning of the <b>OnInit()<b> function of your expert advisor.</li>
<li>Place <b>FrameworkDeInit();</b> at the beginning of the <b>OnDeInit()<b> function of your expert advisor.</li>
<li>Place <b>FrameworkOnTick();</b> at the beginning of the <b>OnTick()<b> function of your expert advisor.</li>
</ol>

<b>Setting up the framework</b>
<p>The framework has some settings that you can adjust to your own style and needs.<br>
This settings are located in the folder *JustUp-MQL-Framework/internal* in a file with the name *settings.mqh*.
Below will be explained all the settings variables and what do they do.</p>
<ol>
<li><b>_ALLOW_INTERFACE_</b>: This will load or not the framework interface when loading it on an expert advisor</li>
<li><b>_DEACTIVATE_LOGO_</b>: This will load the framework logo to the chart when loading it on an expert advisor</li>
<li><b>_ALLOW_ALERTS_</b>: This will allow or not that the framework send error alerts to the metatrader 4/5 terminal when used on an expert advisor</li>
<li><b>_ALLOW_NOTIFICATIONS_</b>: This will allow or not sending notification to the mobile device if there's an error in the framework when used on an expert advisor</li>
<li><b>_ALLOW_LOGS_</b>: This will allow or not saving logs in a logs file in the framework folder</li>
<li><b>_ALLOW_DEBUG_</b>: This will allow or not showing debug messages using the <b>Print()<b> function</li>
<li><b>_ALLOW_DEBUG_LOGS_</b>: This will allow or not saving debug logs in the logs file in the framework folder</li>
<li><b>_LANGUAGE_</b>: This will be the language shown in the interface and logs. Currently only does support english</li>
</ol>

#### Folders Structure
<ul>
    <li><b>internal<b>: This folder will include all the internal files of the framework. Do not modify anything from here except the settings.mqh file.
        <ul>
            <li><b>data</b>: This folder will contain all the data of the framework, including internal constants</li>
            <li><b>logs</b>: This folder will include all the logs files of the framework, divided by days and sessions
                <ul>
                    <li><b>by_days</b>: This folder will include all the logs files divided on each day. 1 day per log, based on the server time</li>
                    <li><b>by_sessions</b>: This folder will include all the logs files divided on each session. 1 session is formed when the framework is loaded, and finish when it is unloaded</li>
                </ul>
            <li><b>res</b>: The resources folder. It will have all the images that are used in the interfaces of the framework</li>
            <li><b>libs</b>: This folder will contain all the internal libraries such as the interface and logging library</li>
            <li><b>lang</b>: This folder will contain all the languages divided in files</li>
        </ul>
    </li>
    <li><b>common</b>: This folder will include all the libraries that are compatible on both language versions; MQL4 & MQL5
        <ul>
            <li><b>classes</b>: This folder will include all the libraries which code is made with a class structure</li>
            <li><b>functions</b>: This folder will include all the libraries which code is made with a function structure</li>
            <li><b>strucs</b>: This folder will include all the libraries that have been made using structures</li>
            <li><b>enums</b>: This folder will have all the enumerators</li>
            <li><b>dics</b>: This folder will have all the dictionaries</li>
            <li><b>packages</b>: This folder will have all the function packages such as Mql4InMql5.mqh</li>
        </ul>
    </li>
    <li><b>changelogs</b>: This folder will include all the changelogs files</li>
    <li><b>library_readmes</b>: This folder will include all the readme files of the libraries</li>
</ul>

#### Libraries List
<p>The framework has a lot of libraries that can be used in your scripts, indicators and expert advisors. Below will be listed all the libraries.
    All the libraries will have a self readme file with the usage and examples in the <b>library_readmes</b> folder.</p>
<ol>
    ...
</ol>

#### Credits
<p>The framework has been made by Jonathan Fernandez, Just Up Corporation CEO. The framework is open-source and can be used by anyone.
    The framework includes a lot of libraries that have been made by other people. Below will be listed all the credits of the libraries.</p>
<ol>
    ...
</ol>

#### License
<p>The framework is under the MIT License. You can read the license in the <b>LICENSE</b> file.</p>
</body>
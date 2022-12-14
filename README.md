<body>
    <p align="center"><a href="https://www.notion.so/just-up/Just-Up-MQL-Framework-5aceaad2812c4e6a94751f92fb9c9c54" target="_blank">
        <img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/a405bc87-58fc-471b-8a07-f1ad1fb1fb52/Aadir_un_poco_de_texto.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221211%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221211T182935Z&X-Amz-Expires=86400&X-Amz-Signature=6f9a25b5edace6250eeaa4d9de75b7abe55a2caa87cfadff9cd2b1c2da32d348&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22A%25C3%25B1adir%2520un%2520poco%2520de%2520texto.png%22&x-id=GetObject">
    </a></p>


# JustUp-MQL-Framework v2
The official Just Up Corporation's framework for Metaquotes Language 4 &amp; 5.
IT IS OPEN SOURCE! Feel free to use it and modify it as you want.

# Wiki
Check the wiki by clicking [here](https://www.notion.so/just-up/Just-Up-MQL-Framework-5aceaad2812c4e6a94751f92fb9c9c54)
The wiki is still under construction, so it is not complete yet, but we're adding more and more content every day.

## Credits <br>
Main Programmer - Jonathan Fernandez, CEO <br>
Collaborator (s): <br>
_No collaborators yet._ <br>

Other public libraries were included into this framework, all the credits will be listed below: <br>
- @szagar in [GitHub](https://github.com/szagar) <br>
- @eromawyn in [GitHub](https://github.com/eromawyn) <br>

## Colaborate <br>
If you want to collaborate with the project feel free to contact me at  <br>
framework@justup.us <br>

If you want to **Push** a file to the repository, please use the open *branch* called **Open**. <br>
All the files pushed to that branch will be reviewed, origanized, and pushed to the **main branch** by me after testing them. <br>

So I do recommend to pull from the *main branch* and push to the *open brach*. <br>

## Last Update 2.1.0 | Changelog <br>
All the libraries from this version are not compatible with the previous versions. <br>
1. The CLogsFile was updated to the version 2.1 - See the change list below:
    - Now the logs files has as extension `.log` instead of .txt
    - Now instead of `error code`, it says `code`, to avoid confusion on logs that are not errors.
2. Now the framework will verify that the autotrading and dlls are checked on the initialization, if are not, it will fail to initialize and `return false`, you can `bypass` this adjusting the settings.
3. Now the internal functions `FrameworkStart()` and `FrameworkInit()` return a `boolean` result instead of just being `void`
4. Fixed the bug of "no return" on the boolean methods of the `CTextFiles class` | Updated to 1.1
5. Now the `CTextFiles class` supports different files extensions like .txt, .dat, & .log | Updated to 2.0, it is completely compatible with the previews version.
5. Now the internal libraries have a defined version number. | Current version 1.0
6. Added the class CLocalTradeCopy - it is a new version of the offlineTradeCopier package but with most advanced features. You can still use the old package for small copy signals.


## Libraries List
The full libraries list and their description can be found on the wiki or by clicking [here](https://just-up.notion.site/Libraries-List-708dd230413a483b8bff0cfec386546e)

_Thanks for using it!_
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![GNU License][license-shield]][license-url]

<h3 align="center">cPanel/WHM Open-Source Scripts</h3>

  <p align="center">
    cPanel/WHM Open-Source Scripts is an unofficial open source project aimed at providing useful documentations and scripts on processes and problems which Sys Admins want to automate
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

cPanel/WHM is one of the most widely used control panels used for web hosting and often System Administrator/Owners lack the skills to modify and edit cPanel/WHM installations. This project is aimed at providing open-source scripts, documentations and examples needed to explore, automate and secure cPanel/WHM.

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [Bash GNU](https://www.gnu.org/software/bash/)
* [PHP](https://php.net/)
* [ReadMe](https://readme.com/)
* [Perl](https://www.perl.org/)
* [Python](https://www.python.org/)

<p align="right">(<a href="#top">back to top</a>)</p>



## Getting Started

Just Click on the specified folder name which you want to explore. All folders contain a readme.MD file which has relevant documentation

### Prerequisites

Most of the scripts and automations use Bash, PHP and Python. There are some dependencies required by these scripts to function. You can install them using the following details below:

* wget

In CentOS, AlmaLinux, CloudLinux streams:
  ```sh
  yum install -y wget
  ```
In Debian based streams like Ubuntu:
  ```sh
  apt install wget
  ```

* Python

In CentOS, AlmaLinux, CloudLinux streams:
  ```sh
  yum install -y python3
  ```
In Debian based streams like Ubuntu:
  ```sh
  apt install python3
  ```
  
* PHP

In CentOS, AlmaLinux, CloudLinux streams:
  ```sh
  yum install -y php
  ```
In Debian based streams like Ubuntu:
  ```sh
  apt install php
  ```

### Installation of cPanel

1. For installation, wget is required.
2. To install through Stable channels, please go to releases for latest updates and commands. (Safe)
3. To install through latest release(Not-Recommended)
   ```sh
   wget -O centos.sh https://raw.githubusercontent.com/ankeshanand1/cpanel/main/installer/centos.sh && chmod 755 centos.sh && ./centos.sh
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the GNU License. See `LICENSE` for more information.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Ankesh Anand - contact@ankeshanand.me

Project Link: [https://github.com/ankeshanand1/cpanel](https://github.com/ankeshanand1/cpanel)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS 
## Acknowledgments

* []()
* []()
* []()

<p align="right">(<a href="#top">back to top</a>)</p>
-->


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/ankeshanand1/cpanel.svg?style=for-the-badge
[contributors-url]: https://github.com/ankeshanand1/cpanel/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ankeshanand1/cpanel.svg?style=for-the-badge
[forks-url]: https://github.com/ankeshanand1/cpanel/network/members
[stars-shield]: https://img.shields.io/github/stars/ankeshanand1/cpanel.svg?style=for-the-badge
[stars-url]: https://github.com/ankeshanand1/cpanel/stargazers
[issues-shield]: https://img.shields.io/github/issues/ankeshanand1/cpanel.svg?style=for-the-badge
[issues-url]: https://github.com/ankeshanand1/cpanel/issues
[license-shield]: https://img.shields.io/github/license/ankeshanand1/cpanel.svg?style=for-the-badge
[license-url]: https://github.com/ankeshanand1/cpanel/blob/master/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]: images/screenshot.png

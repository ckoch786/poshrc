* TODO make script that checks for hunspell and downloads it if needed
1. Install hunspell with
su choco install hunspell.portable

2. Download dictionary
https://cgit.freedesktop.org/libreoffice/dictionaries/plain/en/en_US.dic
see https://cgit.freedesktop.org/libreoffice/dictionaries/tree/en/README_en_US.txt

3. Configure for emacs to use hunspell and its en_US.dic in place of ispell with
(setq ispell-program-name ""
    ispell-alternative-dictionary "")

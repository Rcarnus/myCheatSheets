


#Javascript scrapper:
names = "";
let ele = document.getElementsByClassName('org-people-profile-card__profile-title');
for (let index = 0; index < ele.length; index++) {
            names += ele[index].innerText + "\r\n";
        }
names;

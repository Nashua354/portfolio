List sideNav = [
  {
    "type": "logo",
    "label": "assets/images/logo.png",
    "isActive": false,
  },
  {
    "type": "text",
    "label": "PROJECTS",
    "isActive": false,
  },
  {
    "type": "text",
    "label": "ARTICLES",
    "isActive": false,
  },
  {
    "type": "text",
    "label": "RESUME",
    "isActive": false,
  },
  {
    "type": "text",
    "label": "POETRY",
    "isActive": false,
  },
  {
    "type": "social",
    "isActive": false,
  }
];
sideNavEnable(String label) {
  sideNav.forEach((element) {
    if (element["label"] == label) {
      element["isActive"] = true;
    } else {
      element["isActive"] = false;
    }
  });
}

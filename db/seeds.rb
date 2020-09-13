User.create!(
  [
    {
      name:  "管理者",
      email: "admin@a.com",
      password:  "admin1234",
      password_confirmation: "admin1234",
      admin: true
    },
    {
      name:  "通常のユーザー",
      email: "a@a.com",
      password:  "aaaaaa",
      password_confirmation: "aaaaaa",
      admin: false
    }
  ]
            )

Team.create!(
  [
    {
      id: 3,
      name:"CRAFTSPORTS GT-R"
    },
    {
      id: 8,
      name:"ARTA NSX"
    },
    {
      id: 12,
      name:"CALSONIC GT-R"
    },
    {
      id: 14,
      name:"WAKO'S Supra"
    },
    {
      id: 16,
      name:"Red Bull NSX"
    },
    {
      id: 17,
      name:"KEIHIN NSX"
    },
    {
      id: 19,
      name:"WedsSport Supra"
    },
    {
      id: 23,
      name:"MOTUL GT-R"
    },
    {
      id: 24,
      name:"REALIZE GT-R"
    },
    {
      id: 36,
      name:"au Supra"
    },
    {
      id: 37,
      name:"KeePer Supra"
    },
    {
      id: 38,
      name:"ZENT Supra"
    },
    {
      id: 39,
      name:"DENSO Supra"
    },
    {
      id: 64,
      name:"Modulo NSX"
    },
    {
      id: 100,
      name:"RAYBRIG NSX"
    },
  ]
            )
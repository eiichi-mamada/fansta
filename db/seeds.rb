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
      name:"CRAFTSPORTS MOTUL GT-R"
    },
    {
      id: 8,
      name:"ARTA NSX-GT"
    },
    {
      id: 12,
      name:"CALSONIC IMPUL GT-R"
    },
    {
      id: 14,
      name:"WAKO'S 4CR GR Supra"
    },
    {
      id: 16,
      name:"MOTUL MUGEN NSX-GT"
    },
    {
      id: 17,
      name:"KEIHIN NSX-GT"
    },
    {
      id: 19,
      name:"WedsSport ADVAN GR Supra"
    },
    {
      id: 23,
      name:"MOTUL AUTHECH GT-R"
    },
    {
      id: 24,
      name:"REALIZE ADVAN GT-R"
    },
    {
      id: 36,
      name:"au TOM'S GR Supra"
    },
    {
      id: 37,
      name:"KeePer TOM's GR Supra"
    },
    {
      id: 38,
      name:"ZENT CERUMO GR Supra"
    },
    {
      id: 39,
      name:"DENSO KOBELCO SARD GR Supra"
    },
    {
      id: 64,
      name:"Modulo Epson NSX-GT"
    },
    {
      id: 100,
      name:"RAYBRIG NSX-GT"
    },
  ]
            )
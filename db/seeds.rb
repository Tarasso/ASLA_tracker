# frozen_string_literal: true

User.create!([
  { email: 'kylemrosko@gmail.com', full_name: 'Kyle Mrosko', uid: '112182193838019104439', avatar_url: 'https://lh3.googleusercontent.com/a-/AOh14GiO-O_u8o96IYdrk8a3EkABsLm5aqClsyIGg3Ovmw=s96-c' }
]
            )
StudentMember.create!([
  {
    uin: '928003182',
    first_name: 'Kyle',
    last_name: 'Mrosko',
    class_year: '2023',
    join_date: '2022-03-05',
    member_title: 'officer',
    email: 'kylemrosko@gmail.com',
    phone_number: '+19362306244',
    expected_graduation_date: '2023-05-01',
    social_point_amount: 1,
    meeting_point_amount: 1,
    fundraiser_point_amount: 1,
    informational_point_amount: 1,
    officer_title: 'Super User',
    dues_paid: true,
    picture: 'https://lh3.googleusercontent.com/a-/AOh14GiO-O_u8o96IYdrk8a3EkABsLm5aqClsyIGg3Ovmw=s96-c',
    uid: '112182193838019104439'
  }
]
                     )

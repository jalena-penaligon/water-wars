User.destroy_all
april = User.create(email: "april.dagonese@guildeducation.com")
jalena = User.create(email: "jalena.taylor@guildeducation.com")

wl = april.water_logs.create(oz: 10)
w2 = jalena.water_logs.create(oz: 5)

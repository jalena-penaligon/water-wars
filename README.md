## Instructions
  ### Available Endpoints:
  #### GET https://waterwars.guildeducation.com/api/v1/users
      Sample Response:
      {
        "jalena.taylor@guildeducation.com": 15,
        "april.dagonese@guildeducation.com": 20
      }

  #### POST https://waterwars.guildeducation.com/api/v1/users
      Headers:
        Content-Type: application/json
        Accept: application/json
      Body:
        {
        	"user": {"email": "test@gmail.com"}
        }

      Sample Response:
      {
        "jalena.taylor@guildeducation.com": 15,
        "april.dagonese@guildeducation.com": 20,
        "test@gmail.com": 0
      }

  #### POST https://waterwars.guildeducation.com/api/v1/users/water
      Headers:
        Content-Type: application/json
        Accept: application/json
      Body:
        {
        	"email": "test@gmail.com",
          "oz": 15
        }

      Sample Response:
      {
        "jalena.taylor@guildeducation.com": 15,
        "april.dagonese@guildeducation.com": 20,
        "test@gmail.com": 15
      }

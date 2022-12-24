# SpaceTravelCalculator

This mini app its for calculate the fuel used in a travel to another planets

Calculate the fuel based in the launch and land, so the fuel its the exact amount for all the launch an lands

## Prerequisites

- Docker with Compose
- Maketool (already in linux and mac)

## The first step (Building and Dockerize)

With maketool you can excecute all commands easy, with just `make` all be enough to create all necessary parts

## How to run this?

You can run the code in 3 ways

With preloaded bodies
- Mix command (`make calculate`)
- Using tests (`make testing`)
  
With dynamic
- Phoenix Server (`make up`)

### Mix command

Using `make calculate` you can run all math

You can edit from `/lib/space_travel_calculator/mix/tasks/calculate.ex` and change the params to another ones

### Using tests

Using `make testing` you can run the examples listed on the doc

### Phoenix Server

Exist 2 api routes

To get some plates and their gravity

```
Call: GET /api/planets

Response: 
{
    "earth": {
        "gravity": 9.807, 
        "measure": "m/s^2"
    },
    "mars": {
        "gravity": 3.711, 
        "measure": "m/s^2"
    },
    "moon": {
        "gravity": 1.62, 
        "measure": "m/s^2"
    }
}
```

To calculate based in a route

```
POST /api/calculate {
        "ship_mass": 28801,
        "route": [
          %{
            "type": "launch",
            "gravity": 9.807
          },
          %{
            "type": "land",
            "gravity": 1.62
          },
          %{
            "type": "launch",
            "gravity": 1.62
          },
          %{
            "type": "land",
            "gravity": 9.807
          }
        ]
    }

Response: 
{
    "used_fuel": 51898
}
```

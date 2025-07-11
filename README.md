

# Qatar Cars in R

{qatarcars} provides a more internationally-focused, modern cars-based
demonstration dataset. It mirrors many of the columns in `mtcars`, but
uses (1) non-US-centric makes and models, (2) 2025 prices, and (3)
metric measurements, making it more appropriate for use as an example
dataset outside the United States. It includes almost exactly the same
variables as the `mtcars` dataset:

-   `origin` (the country associated with the car brand)
-   `make` (the brand of the car, such as Toyota or Land Rover)
-   `model` (the specific type of car, such as Land Cruiser or Defender)
-   `length`, `width`, and `height` (all in meters)
-   `trunk` capacity (measured in liters)
-   fuel `economy` (measured in liters per 100 km)
-   `performance` (time in seconds to accelerate from 0 to 100km/h)
-   `mass` in kilograms
-   `price` in 2025 Qatari riyals
-   `type` (the type of the car, such as coupe, sedan, or SUV)
-   `enginetype` (electric, hybrid, or petrol)

The original data was compiled by [Paul
Musgrave](https://paulmusgrave.info/) in January 2025 and is mostly
sourced from [YallaMotors Qatar](https://qatar.yallamotor.com/). See
[Paul’s writeup of the background and purpose of the
data](https://open.substack.com/pub/musgrave/p/introducing-the-qatar-cars-dataset);
access his [original Stata data
here](https://github.com/profmusgrave/qatarcars).

## Installation

{qatarcars} is not (yet?) on CRAN, but the development version can be
installed with {remotes}:

``` r
library(remotes)
install_github('andrewheiss/qatarcars')
```

## Usage

Fuel efficiency gets worse as cars get heavier!

``` r
library(tidyverse)
library(qatarcars)

ggplot(qatarcars, aes(x = mass, y = economy)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Mass (kg)", y = "Fuel economy (L/100km)")
```

<img src="man/figures/README-plot-mass-economy-1.png"
data-fig-align="center" width="480" />

Some of these cars are *really expensive*, so logging is helpful:

``` r
ggplot(qatarcars, aes(x = performance, y = price)) +
  geom_smooth() +
  geom_point(aes(color = type)) +
  scale_y_log10(labels = scales::label_currency(prefix = "QR ")) +
  labs(x = "Fuel economy (L/100km)", y = "Price")
```

<img src="man/figures/README-plot-performance-price-1.png"
data-fig-align="center" width="480" />

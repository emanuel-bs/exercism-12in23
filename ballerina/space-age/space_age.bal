# Returns the age on another planet or error if it is not a planet.
#
# + planet - planet name as a string
# + seconds - person's age measured in seconds
# + return - person's age in years of that planet, or error if unknown planet.
function age(string planet, int seconds) returns float|error {
    if !orbital_periods.hasKey(planet) {
        return error("not a planet");
    }
    return (<float>seconds / orbital_periods.get(planet) / earth_orbital_period_in_seconds).round(2);
}

const map<float> orbital_periods = {
    Mercury: 0.2408467,
    Venus: 0.61519726,
    Earth: 1.0,
    Mars: 1.8808158,
    Jupiter: 11.862615,
    Saturn: 29.447498,
    Uranus: 84.016846,
    Neptune: 164.79132
};

const float earth_orbital_period_in_seconds = 31557600;

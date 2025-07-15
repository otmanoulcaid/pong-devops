const endpoints = [
    'test',
    'home',
    'about',
    'info',
    'contact',
    'shop',
    'not',
    'exist',
    'route',
    'foo',
    'bar'
]

let random = (min = 0, max = endpoints.length) =>
{
    return Math.floor(Math.random() * (max - min) + min)
}

for (let i = 0; i < 200; i++)
    await fetch(`http://localhost:3000/${endpoints[random()]}`);


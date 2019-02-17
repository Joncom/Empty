let project = new Project('Empty');

project.addSources('Sources');
project.addAssets('Assets/**', { readable: true });
project.targetOptions.html5.webgl = false;

resolve(project);

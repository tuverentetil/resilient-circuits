# resilient-circuits
<h1>Supported tags and respective Docker hub link: </h1>
<ul>
<li><a href="https://hub.docker.com/repository/docker/tuverentetil/resilient-circuits"><code>tuverentetil/resilient-circuits:latest</code></a></li>
</ul>
<h1>IBM resilient-circuits python base image. </h1>
Contains:<br>
<ul>
<li>resilient <a href="https://pypi.org/project/resilient/"><code>resilient 35.0.203</code></a></li>
<li>resilient-circuits <a href="https://pypi.org/project/resilient-circuits/"><code>resilient-circuits 35.0.203</code></a></li>
<li>resilient-lib <a href="https://pypi.org/project/resilient-lib/"><code>resilient-lib 35.0.203</code></a></li>
<li>pytest-resilient-circuits <a href="https://pypi.org/project/pytest-resilient-circuits/"><code>pytest-resilient-circuits 35.0.203</code></a></li>
</ul>
I will not run without resilient server nither will example config will not connect to anything.<br>
Default folder for app.config is /home/resilient/.resilient/ and it have to be replaced with correct configuration for IBM Resilient server and installed integrations.<br>
This is base image but can be ran for test:<br>
Start container:<br>
<code>docker run -d tuverentetil/resilient-circuits:latest</code><br>
After it exits because of incorrect config you can run this command on stopped container:<br>
<code>docker cp app.config &lt;your container&gt;:/home/resilient/.resilient/app.config</code><br>
<code>docker restart &lt;your container&gt;</code><br>
After replacing app.config passwords can be set up with: <br>
While container runs:<br>  <code>docker exec -it &lt;your container&gt; res-keyring</code><br>
After restart container:<br> <code>docker restart &lt;your container&gt;</code>



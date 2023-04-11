within ;
package MSGLib

  class Documentation
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>MSGLib provides functionality to describe message passing communication (MPC) between models.</p>
<h4>STRUCTURE</h4>
<p>The library includes the following packages:</p>
<ul>
<li><span style=\"font-family: monospace;\">BufferReal</span>, supports MPC using messages of type Real.</li>
<li><span style=\"font-family: monospace;\">BufferArray</span>, supports MPC using messages of type Array of Real.</li>
<li><span style=\"font-family: monospace;\">Examples</span>, includes multiple examples to illustrate the functionality and use of the library.</li>
</ul>
<p>Each component of these packages includes its own documentation.</p>
<h4>FUNCTIONALITY</h4>
<p>The library provides an external object, named <span style=\"font-family: monospace;\">buffer</span>, that depending on the type of messages used in the model will correspond to the one in the <span style=\"font-family: monospace;\">BufferReal</span> or the <span style=\"font-family: monospace;\">BufferArray</span> packages. </p>
<p>A buffer represents a container for messages. Messages can be inserted, extracted, modified and read from a buffer. Also, two buffers can be &ldquo;coupled&rdquo;, that represents a directed communication channel between both buffers (i.e., it is only defined from the origin to the destination). Messages stored in a buffer can be sent to its coupled destinations. The following functions are included to manage messages and buffers:</p>
<ul>
<li><span style=\"font-family: monospace;\">bsize</span>: used to observe the number of messages in a buffer. </li>
<li><span style=\"font-family: monospace;\">bput</span>: used to insert a message in a buffer. </li>
<li><span style=\"font-family: monospace;\">bget</span>: used to extract a message from a buffer. </li>
<li><span style=\"font-family: monospace;\">bread</span>: used to observe a message in a buffer. </li>
<li><span style=\"font-family: monospace;\">bwrite</span>: used to modify the value of a message in a buffer. </li>
<li><span style=\"font-family: monospace;\">couple</span>: used to define a communication channel between two buffers (one as origin and the other as destination). </li>
<li><span style=\"font-family: monospace;\">bsend</span>: used to send the messages stored in a buffer to its previously defined destinations. <br></li>
</ul>
<p>In order to facilitate the communication between model components, several interface ports are included in the library. Each port includes: a buffer, named <span style=\"font-family: monospace;\">B</span>, that is used to define communication channels and store the transmitted messages; and a Real variable, named <span style=\"font-family: monospace;\">M</span>, used to synchronize the transmission of messages:</p>
<ul>
<li><span style=\"font-family: monospace;\">InPort</span> represents an input port used to receive messages. Additionally to the common components (<span style=\"font-family: monospace;\">B</span> and <span style=\"font-family: monospace;\">M</span>), input ports include a boolean flag, named <span style=\"font-family: monospace;\">rcv</span>, that signals the reception of new messages and can be used as an event condition to manage the received messages.</li>
<li><span style=\"font-family: monospace;\">OutPort</span> represents an output port for outgoing messages. Additionally to the common components (B and M), output ports include an array of <span style=\"font-family: monospace;\">Driver</span> models. The driver model is used to schedule and synchronize the transmission of the output messages stored in the port to its destinations. Output messages need to be inserted in the buffer of the output port before the transmission is scheduled. The array of drivers is used to support multiple sequential transmissions during the same time instant (e.g., due to event iterations, a loop in the communications, etc.). A boolean flag, named <span style=\"font-family: monospace;\">snd</span>, is used to signal the successive transmissions using different drivers of the array.</li>
<li><span style=\"font-family: monospace;\">RInPort</span> and <span style=\"font-family: monospace;\">ROutPort</span> represent input and output &ldquo;router&rdquo; ports, respectively. These are intermediate ports in a communication channel that do not correspond to final destinations for messages. For example, ports in the interface of a model that are directly connected to a port of an internal component. The coupling procedure and the transmission of the messages automatically flattens the structure of the communication channels. Messages are sent across router ports to their final destinations.</li>
</ul>
<p><br><img width = 500 src=\"modelica://MSGLib/Figures/ports.png\"/></p>
<p><br>The description of communication channels between ports is sumarized in the following figure. The <span style=\"font-family: monospace;\">couple</span> function is used to define couplings between buffers (<span style=\"font-family: monospace;\">B</span>) from output ports to intput ports. Additionally, the values of the <span style=\"font-family: monospace;\">M</span> variables of the ports need to be related. The <span style=\"font-family: monospace;\">M</span> variable of an input port has to be assigned to the sum of all the <span style=\"font-family: monospace;\">M</span> variables of its coupled output ports.</p>
<p><br><img width = 1000 src=\"modelica://MSGLib/Figures/couple.png\"/></p>
</html>"));
  end Documentation;

  class LICENSE
    extends Modelica.Icons.Information;

    annotation (Documentation(info="<html>
<p>                   GNU LESSER GENERAL PUBLIC LICENSE</p>
<p>                       Version 3, 29 June 2007</p>
<p>Copyright (C) 2007 Free Software Foundation, Inc. &lt;https://fsf.org/&gt;<br>
Everyone is permitted to copy and distribute verbatim copies<br>
of this license document, but changing it is not allowed.</p>

<p>This version of the GNU Lesser General Public License incorporates<br>
the terms and conditions of version 3 of the GNU General Public<br>
License, supplemented by the additional permissions listed below.</p>

<p>0. Additional Definitions.</p>

<p>As used herein, &quot;this License&quot; refers to version 3 of the GNU Lesser<br>
General Public License, and the &quot;GNU GPL&quot; refers to version 3 of the GNU<br>
General Public License.</p>

<p>&quot;The Library&quot; refers to a covered work governed by this License,<br>
other than an Application or a Combined Work as defined below.</p>

<p>An &quot;Application&quot; is any work that makes use of an interface provided<br>
by the Library, but which is not otherwise based on the Library.<br>
Defining a subclass of a class defined by the Library is deemed a mode<br>
of using an interface provided by the Library.</p>

<p>A &quot;Combined Work&quot; is a work produced by combining or linking an<br>
Application with the Library.  The particular version of the Library<br>
with which the Combined Work was made is also called the &quot;Linked<br>
Version&quot;.</p>

<p>The &quot;Minimal Corresponding Source&quot; for a Combined Work means the<br>
Corresponding Source for the Combined Work, excluding any source code<br>
for portions of the Combined Work that, considered in isolation, are<br>
based on the Application, and not on the Linked Version.</p>

<p>The &quot;Corresponding Application Code&quot; for a Combined Work means the<br>
object code and/or source code for the Application, including any data<br>
and utility programs needed for reproducing the Combined Work from the<br>
Application, but excluding the System Libraries of the Combined Work.</p>

<p>1. Exception to Section 3 of the GNU GPL.</p>

<p>You may convey a covered work under sections 3 and 4 of this License<br>
without being bound by section 3 of the GNU GPL.</p>

<p>2. Conveying Modified Versions.</p>

<p>If you modify a copy of the Library, and, in your modifications, a<br>
facility refers to a function or data to be supplied by an Application<br>
that uses the facility (other than as an argument passed when the<br>
facility is invoked), then you may convey a copy of the modified<br>
version:</p>

<p>&nbsp;&nbsp; a) under this License, provided that you make a good faith effort to<br>
   &nbsp;&nbsp;ensure that, in the event an Application does not supply the<br>
   &nbsp;&nbsp;function or data, the facility still operates, and performs<br>
   &nbsp;&nbsp;whatever part of its purpose remains meaningful, or</p>
<p>&nbsp;&nbsp;   b) under the GNU GPL, with none of the additional permissions of<br>
   &nbsp;&nbsp;this License applicable to that copy.</p>

<p>  3. Object Code Incorporating Material from Library Header Files.</p>

<p>  The object code form of an Application may incorporate material from<br>
a header file that is part of the Library.  You may convey such object<br>
code under terms of your choice, provided that, if the incorporated<br>
material is not limited to numerical parameters, data structure<br>
layouts and accessors, or small macros, inline functions and templates<br>
(ten or fewer lines in length), you do both of the following:</p>

<p>&nbsp;&nbsp;   a) Give prominent notice with each copy of the object code that the<br>
  &nbsp;&nbsp;Library is used in it and that the Library and its use are<br>
  &nbsp;&nbsp; covered by this License.</p>

<p>&nbsp;&nbsp;   b) Accompany the object code with a copy of the GNU GPL and this license<br>
  &nbsp;&nbsp;document.</p>

<p><br>  4. Combined Works.</p>

<p>  You may convey a Combined Work under terms of your choice that,<br>
taken together, effectively do not restrict modification of the<br>
portions of the Library contained in the Combined Work and reverse<br>
engineering for debugging such modifications, if you also do each of<br>
the following:</p>

<p>&nbsp;&nbsp;   a) Give prominent notice with each copy of the Combined Work that<br>
   &nbsp;&nbsp;the Library is used in it and that the Library and its use are<br>
   &nbsp;&nbsp;covered by this License.</p>

<p>&nbsp;&nbsp;   b) Accompany the Combined Work with a copy of the GNU GPL and this license<br>
  &nbsp;&nbsp;document.</p>

<p>&nbsp;&nbsp;   c) For a Combined Work that displays copyright notices during<br>
  &nbsp;&nbsp;execution, include the copyright notice for the Library among<br>
  &nbsp;&nbsp;these notices, as well as a reference directing the user to the<br>
  &nbsp;&nbsp;copies of the GNU GPL and this license document.</p>

<p>&nbsp;&nbsp;   d) Do one of the following:</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;       0) Convey the Minimal Corresponding Source under the terms of this<br>
   &nbsp;&nbsp;&nbsp;&nbsp;   License, and the Corresponding Application Code in a form<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    suitable for, and under terms that permit, the user to<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    recombine or relink the Application with a modified version of<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    the Linked Version to produce a modified Combined Work, in the<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    manner specified by section 6 of the GNU GPL for conveying<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    Corresponding Source.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;       1) Use a suitable shared library mechanism for linking with the<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    Library.  A suitable mechanism is one that (a) uses at run time<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    a copy of the Library already present on the user&apos;s computer<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    system, and (b) will operate properly with a modified version<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    of the Library that is interface-compatible with the Linked<br>
   &nbsp;&nbsp;&nbsp;&nbsp;    Version.</p>

<p>&nbsp;&nbsp;   e) Provide Installation Information, but only if you would otherwise<br>
   &nbsp;&nbsp;be required to provide such information under section 6 of the<br>
   &nbsp;&nbsp;GNU GPL, and only to the extent that such information is<br>
   &nbsp;&nbsp;necessary to install and execute a modified version of the<br>
   &nbsp;&nbsp;Combined Work produced by recombining or relinking the<br>
   &nbsp;&nbsp;Application with a modified version of the Linked Version. (If<br>
   &nbsp;&nbsp;you use option 4d0, the Installation Information must accompany<br>
   &nbsp;&nbsp;the Minimal Corresponding Source and Corresponding Application<br>
   &nbsp;&nbsp;Code. If you use option 4d1, you must provide the Installation<br>
   &nbsp;&nbsp;Information in the manner specified by section 6 of the GNU GPL<br>
   &nbsp;&nbsp;for conveying Corresponding Source.)</p>

<p>  5. Combined Libraries.</p>

<p>  You may place library facilities that are a work based on the<br>
Library side by side in a single library together with other library<br>
facilities that are not Applications and are not covered by this<br>
License, and convey such a combined library under terms of your<br>
choice, if you do both of the following:</p>

<p>&nbsp;&nbsp;   a) Accompany the combined library with a copy of the same work based<br>
   &nbsp;&nbsp;on the Library, uncombined with any other library facilities,<br>
   &nbsp;&nbsp;conveyed under the terms of this License.</p>

<p>&nbsp;&nbsp;   b) Give prominent notice with the combined library that part of it<br>
   &nbsp;&nbsp;is a work based on the Library, and explaining where to find the<br>
   &nbsp;&nbsp;accompanying uncombined form of the same work.</p>

<p>  6. Revised Versions of the GNU Lesser General Public License.</p>

<p>  The Free Software Foundation may publish revised and/or new versions<br>
of the GNU Lesser General Public License from time to time. Such new<br>
versions will be similar in spirit to the present version, but may<br>
differ in detail to address new problems or concerns.</p>

<p>  Each version is given a distinguishing version number. If the<br>
Library as you received it specifies that a certain numbered version<br>
of the GNU Lesser General Public License &quot;or any later version&quot;<br>
applies to it, you have the option of following the terms and<br>
conditions either of that published version or of any later version<br>
published by the Free Software Foundation. If the Library as you<br>
received it does not specify a version number of the GNU Lesser<br>
General Public License, you may choose any version of the GNU Lesser<br>
General Public License ever published by the Free Software Foundation.</p>

<p>  If the Library as you received it specifies that a proxy can decide<br>
whether future versions of the GNU Lesser General Public License shall<br>
apply, that proxy&apos;s public statement of acceptance of any version is<br>
permanent authorization for you to choose that version for the<br>
Library.</p>
</html>"));
  end LICENSE;

  package BufferReal
      class buffer
      extends ExternalObject;
      function constructor "Construct new buffer"
        output buffer b;

        external "C" b = initBufferR();
        annotation (
          Include = "#include \"msglib.c\"");
      end constructor;

      function destructor "Release buffer"
        input buffer b;

        external "C" closeBufferR(b);
        annotation (
          Include = "#include \"msglib.c\"");
      end destructor;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Line(points = {{-18, 40}}, color = {28, 108, 200})}),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        Documentation(info="<html>
<p>External object used as container for messages of type Real.</p>
<p>It is recommended to import this package to facilitate its use:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferReal.*;</span></p>
<p>Declared buffers need to be initalized calling its constructor function:</p>
<p><span style=\"font-family: monospace; color: #ff0000;\">buffer</span>&nbsp;b = <span style=\"font-family: monospace; color: #ff0000;\">buffer</span>();</p>
</html>"));
      end buffer;

    function bsize "Size of a buffer"
      input buffer b "buffer";
      output Integer n "size";

      external "C"  n = bsizeR(b) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to observe the size of a buffer (i.e., the number of messages currently stored in the buffer).</p>
<p><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">   import MSGLib.BufferReal.*;</span></p>
<p><span style=\"font-family: monospace;\">   Integer s;</span></p>
<p><span style=\"font-family: monospace;\">   buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">   s = bsize(b); // s = 0, empty buffer </span></p>
</html>"));
    end bsize;

    function bput "insert msg into buffer b"
      input Real msg "message";
      input buffer b "buffer";
      input Integer index = bsize(b)+1 "insert location";

      external "C"  bputR(msg,b,index) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to insert a message into a buffer.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location for the new message in the buffer. If its value is out of bounds (i.e., &lt;= 0 or &gt;= bsize(b)) the message is inserted at the end of the buffer.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">   import MSGLib.BufferReal.*;</span></p>
<p><span style=\"font-family: monospace;\">   Real msg = 1;</span></p>
<p><span style=\"font-family: monospace;\">   buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">   bput(msg,b);</span></p>
</html>"));
    end bput;

      function bget "extract message from a buffer"
        input buffer b "buffer";
        input Integer index = 1 "location of the message to extract";
        output Real msg "message";

      external "C"  msg = bgetR(b,index) annotation (
        Include = "#include \"msglib.c\"");
        annotation (Documentation(info="<html>
<p>Function used to extract a message from a buffer. Message is removed form the buffer and the remaining messages are reordered.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location of the message to extract. Its default value is bsize(b), in order to extract the last message and avoid reordering the rest of messages in the buffer. </p>
<p>If the value of <span style=\"font-family: monospace;\">index</span> is out of bounds, no message is extracted and a 0 is returned.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">   import MSGLib.BufferReal.*;</span></p>
<p><span style=\"font-family: monospace;\">   buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">   Real msg;</span></p>
<p><span style=\"font-family: monospace;\">   Integer s;</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">   bput(2,b);</span></p>
<p><span style=\"font-family: monospace;\">   msg = bget(b); // msg = 2</span></p>
<p><span style=\"font-family: monospace;\">   s = bsize(b); // s = 0</span></p>
</html>"));
      end bget;

    function bread "read a message from the buffer"
      input buffer b "buffer";
      input Integer index = 1 "read location";
      output Real msg "message";

      external "C"  msg = breadR(b,index) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to read the value of a message in a buffer. Message is not removed from the buffer.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location of the message to read. Its default value is 1, to select the first message in the buffer. </p>
<p>If the value of <span style=\"font-family: monospace;\">index</span> is out of bounds a 0 is returned.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">   import MSGLib.BufferReal.*;</span></p>
<p><span style=\"font-family: monospace;\">   buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">   Real msg;</span></p>
<p><span style=\"font-family: monospace;\">   Integer s;</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">   bput(2,b);</span></p>
<p><span style=\"font-family: monospace;\">   msg = bread(b); // msg = 2</span></p>
<p><span style=\"font-family: monospace;\">   s = bsize(b); // s = 1</span></p>
</html>"));
    end bread;

      function bwrite "read message from a buffer"
        input buffer b "buffer";
        input Real newval "new value";
        input Integer index = 1 "location of the message";
        output Real oldval "old value";

      external "C"  oldval = bwriteR(b,newval,index) annotation (
        Include = "#include \"msglib.c\"");
        annotation (Documentation(info="<html>
<p>Function used to set a new value for a message in a buffer. The old value is returned.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location of the message to read, being 1 by default. If the value of <span style=\"font-family: monospace;\">index</span> is out of bounds, no message is observed and a 0 is returned.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">   import MSGLib.BufferReal.*;</span></p>
<p><span style=\"font-family: monospace;\">   buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">   Real msg;</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">   bput(2,b);</span></p>
<p><span style=\"font-family: monospace;\">   msg = bread(b); // msg = 2</span></p>
<p><span style=\"font-family: monospace;\">   bwrite(b,1); </span></p>
<p><span style=\"font-family: monospace;\">   msg = bread(b); // now msg = 1</span></p>
</html>"));
      end bwrite;

    function couple "Define a communication channel between two buffers (from origin to destination)"
      input buffer o "origin";
      input buffer d "destination";

      external "C"  coupleR(o,d) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to define couplings (i.e., communication channels) between buffers. The coupling is only defined from the origin to the destination, and not otherwise.</p>
<p>Couplings should be performed only once at the beginning of the simulation during the initialization of the model, thus they have to be included in the initial algoritm section of a model. </p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferReal.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b1 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">buffer b2 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">initial algorithm</span></p>
<p><span style=\"font-family: monospace;\">couple(b1,b2); </span></p>
</html>"));
    end couple;

    function bsend
      input buffer b;

      external "C"  bsendR(b) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to send the messages stored in a buffer to its destinations (previously defined using the couple function). </p>
<p>Messages are directly copied to the final destinations, across any intermediate buffer coupled in the communication channel. Final destinations are buffers included in a communication channel that do not have any further destinations. </p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">   import MSGLib.BufferReal.*;</span></p>
<p><span style=\"font-family: monospace;\">   buffer b1 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">   buffer b2 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">   buffer b3 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">   Real msg;</span></p>
<p><span style=\"font-family: monospace;\">   Integer s;</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">initial algorithm</span></p>
<p><span style=\"font-family: monospace;\">   couple(b1,b2);</span></p>
<p><span style=\"font-family: monospace;\">   couple(b2,b3);</span></p>
<p><span style=\"font-family: monospace;\">algorithm</span></p>
<p><span style=\"font-family: monospace;\">   bput(2,b1);</span></p>
<p><span style=\"font-family: monospace;\">   bsend(b1);</span></p>
<p><span style=\"font-family: monospace;\">   msg = bread(b2); // msg = 0, since msg is transmitted directly to b3</span></p>
<p><span style=\"font-family: monospace;\">   msg = bread(b3); // msg = 2</span></p>
</html>"));
    end bsend;

  model InPort
    input Real M; // number of messages received
    buffer B = buffer(); // buffer that contains received messages
    Boolean rcv; // message reception flag
    protected
    Integer nmsg;
  equation
    nmsg = integer(M);
    rcv = nmsg <> pre(nmsg);
      annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}), Diagram(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}),
        Documentation(info="<html>
<p>Port used to define an input point for incomming messages in a model.</p>
<p>It includes:</p>
<ul>
<li><span style=\"font-family: monospace;\">B, </span>buffer used as container for the received messages.</li>
<li><span style=\"font-family: monospace;\">M,</span> used to synchronize the communication of messages.</li>
<li><span style=\"font-family: monospace;\">rcv</span>, used as a boolean flag to observe and detect the reception of messages.</li>
</ul>
<p><br>When new messages are received the flag <span style=\"font-family: monospace;\">rcv</span> becomes true. This flag can be used as condition in a when statement for managing the reception of messages.</p>
<p>Received messages are available in the buffer <span style=\"font-family: monospace;\">B</span> and can be managed using the corresponding functions (<span style=\"font-family: monospace;\">bsize</span>, <span style=\"font-family: monospace;\">bget</span>, <span style=\"font-family: monospace;\">bread</span>, <span style=\"font-family: monospace;\">bwrite</span>, etc.).</p>
</html>"));
  end InPort;

  model Driver
    parameter Boolean bag = false;
    Real M; // number of messages sent
    outer buffer B; // buffer used to transmit messages
    discrete input Real tSend(start=Modelica.Constants.inf, fixed=true); // time to send output
    input Real msg; // output message
    Boolean phase_passive(start=false, fixed=true);
    Boolean phase_active;
    Boolean phase_fired;
    Boolean event0 = time >= pre(tSend) and initial();
  initial equation
     pre(phase_fired) = time < pre(tSend);
     pre(phase_active) = time >= pre(tSend);
  equation

    phase_passive = pre(phase_fired) and tSend <> pre(tSend) or pre(phase_passive) and not (time >= pre(tSend));
    phase_active = (pre(phase_passive) and event0) or (pre(phase_passive) and time >= pre(tSend));
    phase_fired = pre(phase_active) or pre(phase_fired) and tSend == pre(tSend);

  algorithm
    when phase_active then
      if not bag then
        bput(pre(msg), B);
      end if;
      bsend(B);
      M := pre(M) + 1;
    end when;

      annotation (Documentation(info="<html>
<p>This model is used to support multiple transmissions at the same time instant. It is used in the <span style=\"font-family: monospace;\">OutPort</span> model, but it is not intented to be used in other models.</p>
</html>"));
  end Driver;

  model OutPort
    parameter Integer nDrivers = 5; // number of drivers in the port
    discrete input Real tSend(start=Modelica.Constants.inf, fixed=true); // time to send output
    input Boolean snd; // boolean flag that activates driver to send output message
    Real M; // number of messages sent
    inner buffer B = buffer(); // buffer used to transmit messages
    protected
    Integer activeDriver(start=1);
    Driver D[nDrivers](each bag=true);
  equation

    for i in 1:nDrivers loop
      when change(snd) then
        if i == activeDriver then
          //Modelica.Utilities.Streams.print(String(time)+": activedriver = "+String(activeDriver));
          D[i].tSend = tSend;
        else
          D[i].tSend = Modelica.Constants.inf;
        end if;
      end when;
      D[i].msg = 0;
    end for;
     M =  sum(D[i].M for i in 1:nDrivers);

  algorithm
     when change(snd) then
       if tSend > pre(tSend) then
         activeDriver:= 1;
       else
         activeDriver := pre(activeDriver) +1;
       end if;
    end when;

      annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}), Diagram(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}),
        Documentation(info="<html>
<p>Port used to define an output point for outgoing messages in a model. </p>
<p>This port supports the <b>transmission of a bag of output messages per time instant, but multiple messages can be sent during the same instant in multiple iterations</b>. The transmission of a the bag is scheduled at time tSend by activating the flag snd (switching its current value, e.g., snd = not snd). The bag has to be prevously created by inserting messages into the buffer <span style=\"font-family: monospace;\">B</span>. The first driver model of the array is used for the first transmission in the current time instant.</p>
<p>If further messages need to be sent during the same time instant (e.g., maybe due to the occurrence of other events in the model that may trigger the transmission of additional messages), the next driver of the array is used. Further transmissions are activated by additional changes in the snd flag. New bags of output messages need to be inserted in the buffer previously to the modification of the <span style=\"font-family: monospace;\">snd</span> flag.</p>
<p><br>It includes:</p>
<ul>
<li><span style=\"font-family: monospace;\">nDrivers</span>, parameter that defines the number of drivers of the array (i.e., the maximum number of subsequent outputs that can be sent during the same instant). </li>
<li><span style=\"font-family: monospace;\">tSend</span>, used to schedule the time event for the transmission of the message.</li>
<li><span style=\"font-family: monospace;\">snd</span>, used to activate the transmisstion of messages in subsequent iterations during each time instant.</li>
<li><span style=\"font-family: monospace;\">M</span>, is used to synchronize the transmission between the output port and the input port.</li>
<li><span style=\"font-family: monospace;\">B</span>, is the buffer used as container for the output message.</li>
</ul>
</html>"));
  end OutPort;

  model RInPort = InPort annotation (Documentation(info="<html>
<p>Port used to define input &quot;router&quot; ports. These are ports that define the external interface of a model and are directly coupled to input ports of internal components of the model.</p>
<p>These ports should only be used to define communication channels (i.e., couplings).</p>
</html>"));

  model ROutPort
    Real M;
    buffer B = buffer();
      annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}), Diagram(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}),
        Documentation(info="<html>
<p>Port used to define output &quot;router&quot; ports. These are ports that define the external interface of a model and are directly coupled to output ports of internal components of the model.</p>
<p>These ports should only be used to define communication channels (i.e., couplings).</p>
</html>"));
  end ROutPort;

    annotation (Documentation(info="<html>
<p>This package supports MPC for messages of <span style=\"font-family: monospace;\">Real</span> type.</p>
</html>"));
  end BufferReal;

  package BufferArray
      class buffer
      extends ExternalObject;
      function constructor "Construct new buffer"
        output buffer b;
        external "C" b = initBufferA();
        annotation (
          Include = "#include \"msglib.c\"");
      end constructor;

      function destructor "Release buffer"
        input buffer b;
        external "C" closeBufferA(b);
        annotation (
          Include = "#include \"msglib.c\"");
      end destructor;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Line(points = {{-18, 40}}, color = {28, 108, 200})}),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        Documentation(info="<html>
<p>External object used as container for messages of type Array of Real (<span style=\"font-family: monospace;\">Real[]</span>).</p>
<p>It is recommended to import this package to facilitate its use:</p>
<p>import MSGLib.BufferArray.*;</p>
<p>Declared buffers need to be initalized calling its constructor function:</p>
<p>buffer b = buffer();</p>
</html>"));
      end buffer;

    function bsize "observe the number of messages in the buffer"
      input buffer b "buffer";
      output Integer n "size";

      external "C"  n = bsizeA(b) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to observe the size of a buffer (i.e., the number of messages currently stored in the buffer).</p>
<p><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">Integer s;</span></p>
<p><span style=\"font-family: monospace;\">buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">s = bsize(b); // s = 0, empty buffer</span></p>
</html>"));
    end bsize;

    function bput "insert a new message in the buffer"
      input Real msg[:] "message";
      input buffer b "buffer";
      input Integer index = bsize(b)+1 "location to insert";
      external "C"  bputA(msg,size(msg,1),b,index) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to insert a message into a buffer.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location for the new message in the buffer. If its value is out of bounds (i.e., &lt;= 0 or &gt;= bsize(b)) the message is inserted at the end of the buffer.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">Real msg[2] = {1,2};</span></p>
<p><span style=\"font-family: monospace;\">buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">bput(msg,b);</span></p>
</html>"));
    end bput;

    function bgetpos
      input buffer b;
      input Integer pos = 1;
      input Integer index = 1;
      output Real msgpos;
      external "C"  msgpos = bgetposA(b,pos,index) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to read one position of a message, and to extract that message from the buffer. Message is removed form the buffer and the remaining messages are reordered.</p>
<p>The position of a message corresponds to one of the components of the array that define the message (e.g., msg = {a,b}; position 1 = a and position 2 = b).</p>
<p>The index parameter can be used to select the location of the message to extract (i.e., its index in the buffer). Its default value is bsize(b), in order to extract the last message and avoid reordering the rest of messages in the buffer. </p>
<p>If the value of index is out of bounds, no message is extracted and a 0 is returned.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">Real msg[2] = {4,5};</span></p>
<p><span style=\"font-family: monospace;\">Real msgpos;</span></p>
<p><span style=\"font-family: monospace;\">Integer s;</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">bput(msg,b);</span></p>
<p><span style=\"font-family: monospace;\">msgpos = bgetpos(b); // msgpos = 4</span></p>
<p><span style=\"font-family: monospace;\">s = bsize(b); // s = 0, msg removed by previous bgetpos.</span></p>
</html>"));
    end bgetpos;

    function bget
      input buffer b;
      input Integer len;
      input Integer index = 1;
      output Real msg[len];
    algorithm
      for i in 1:len-1 loop
        msg[i] :=breadpos(
              b,
              i,
              index);
      end for;
      msg[len] :=bgetpos(
        b,
        len,
        index);
      annotation (Documentation(info="<html>
<p>Function used to extract a message from a buffer. Message is removed form the buffer and the remaining messages are reordered.</p>
<p>The <span style=\"font-family: monospace;\">len</span> parameter is used to define the size of the message to extract (i.e., Real msg[2] -&gt; len = 2).</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location of the message to extract (i.e., its index in the buffer). Its default value is <span style=\"font-family: monospace;\">bsize(b)</span>, in order to extract the last message and avoid reordering the rest of messages in the buffer. </p>
<p>If the value of <span style=\"font-family: monospace;\">index</span> is out of bounds, no message is extracted and a 0 is returned.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">Real msg[2] = {4,5};</span></p>
<p><span style=\"font-family: monospace;\">Real msg2[2];</span></p>
<p><span style=\"font-family: monospace;\">Integer s;</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">bput(msg,b);</span></p>
<p><span style=\"font-family: monospace;\">msg2 = bget(b,2); // msg2 = {4,5}</span></p>
<p><span style=\"font-family: monospace;\">s = bsize(b); // s = 0, msg removed by previous bget.</span></p>
</html>"));
    end bget;

    function breadpos
      input buffer b;
      input Integer pos = 1;
      input Integer index = 1;
      output Real msgpos;

      external "C"  msgpos = breadposA(b,pos,index) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to read the value of a position of a message in a buffer. Message is not removed from the buffer.</p>
<p>The <span style=\"font-family: monospace;\">pos</span> parameter is used to select the desired position. Its default value is 1.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location of the message to read. Its default value is 1, to select the first message in the buffer. </p>
<p>If the value of <span style=\"font-family: monospace;\">index</span> is out of bounds a 0 is returned.</p>
<p><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">Real msg[2] = {4,5};</span></p>
<p><span style=\"font-family: monospace;\">Real msgpos;</span></p>
<p><span style=\"font-family: monospace;\">Integer s;</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">bput(msg,b);</span></p>
<p><span style=\"font-family: monospace;\">msgpos = breadpos(b); // msgpos = 4</span></p>
<p><span style=\"font-family: monospace;\">s = bsize(b); // s = 1</span></p>
</html>"));
    end breadpos;

    function bread
        input buffer b;
      input Integer len;
      input Integer index = 1;
      output Real msg[len];
    algorithm
      for i in 1:len loop
        msg[i] :=breadpos(
              b,
              i,
              index);
      end for;
      annotation (Documentation(info="<html>
<p>Function used to read the value of a message in a buffer. Message is not removed from the buffer.</p>
<p>The <span style=\"font-family: monospace;\">len</span> parameter is used to define the size of the message.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location of the message to read. Its default value is 1, to select the first message in the buffer. </p>
<p>If the value of <span style=\"font-family: monospace;\">index</span> is out of bounds a 0 is returned.</p>
<p><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">Real msg[2] = {4,5};</span></p>
<p><span style=\"font-family: monospace;\">Real msg2[2];</span></p>
<p><span style=\"font-family: monospace;\">Integer s;</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">bput(msg,b);</span></p>
<p><span style=\"font-family: monospace;\">msg2 = bread(b,2); // msg2 = {4,5}</span></p>
<p><span style=\"font-family: monospace;\">s = bsize(b); // s = 1</span></p>
</html>"));
    end bread;

    function bwritepos
      input buffer b;
      input Real newval;
      input Integer pos = 1;
      input Integer index = 1;
      output Real preval;

      external "C"  preval = bwriteposA(b,newval,pos,index) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to set a new value for position of a message in a buffer. The old value of that position is returned.</p>
<p>The new value is specified using the <span style=\"font-family: monospace;\">newval</span> parameter.</p>
<p>The position is selected using the <span style=\"font-family: monospace;\">pos</span> parameter. Its default value is 1.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location of the message to read, being 1 by default. If the value of <span style=\"font-family: monospace;\">index</span> is out of bounds, no message is observed and a 0 is returned.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">Real msg[2] = {4,5};</span></p>
<p>Real msgpos;</p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">bput(msg,b);</span></p>
<p><span style=\"font-family: monospace;\">msgpos = breadpos(b); // msgpos = 4</span></p>
<p><span style=\"font-family: monospace;\">bwritepos(b,7); </span></p>
<p><span style=\"font-family: monospace;\">msgpos = bread(b); // now msgpos = 7</span></p>
</html>"));
    end bwritepos;

    function bwrite
      input buffer b;
      input Real newmsg[:];
      input Integer index = 1;
    algorithm
      for i in 1:size(newmsg,1) loop
        bwritepos(
              b,
              newmsg[i],
              i,
              index);
      end for;
      annotation (Documentation(info="<html>
<p>Function used to set a new value for a message in a buffer. The old value of that position is returned.</p>
<p>The new value is specified using the <span style=\"font-family: monospace;\">newmsg</span> parameter.</p>
<p>The <span style=\"font-family: monospace;\">index</span> parameter can be used to select the location of the message to read, being 1 by default. If the value of <span style=\"font-family: monospace;\">index</span> is out of bounds, no message is observed and a 0 is returned.</p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b = buffer();</span></p>
<p><span style=\"font-family: monospace;\">Real msg[2] = {4,5};</span></p>
<p><span style=\"font-family: monospace;\">Real msg2[2] = {7,8};</span></p>
<p><span style=\"font-family: monospace;\">Real msg3[2];</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">bput(msg,b);</span></p>
<p><span style=\"font-family: monospace;\">bwrite(b,msg2); </span></p>
<p><span style=\"font-family: monospace;\">msg3 = bread(b,2); // msg3 = {7,8};</span></p>
</html>"));
    end bwrite;

    function couple
      input buffer o;
      input buffer d;

      external "C"  coupleA(o,d) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to define couplings (i.e., communication channels) between buffers. The coupling is only defined from the origin to the destination, and not otherwise.</p>
<p>Couplings should be performed only once at the beginning of the simulation during the initialization of the model, thus they have to be included in the initial algoritm section of a model. </p>
<p><br><u>Example</u>:</p>
<p><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b1 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">buffer b2 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">initial algorithm</span></p>
<p><span style=\"font-family: monospace;\">couple(b1,b2); </span></p>
</html>"));
    end couple;

    function bsend
      input buffer b;
      external "C"  bsendA(b) annotation (
        Include = "#include \"msglib.c\"");
      annotation (Documentation(info="<html>
<p>Function used to send the messages stored in a buffer to its destinations (previously defined using the couple function). </p>
<p>Messages are directly copied to the final destinations, across any intermediate buffer coupled in the communication channel. Final destinations are buffers included in a communication channel that do not have any further destinations. </p>
<p><br><u>Example</u>:</p>
<p><br><span style=\"font-family: monospace;\">import MSGLib.BufferArray.*;</span></p>
<p><span style=\"font-family: monospace;\">buffer b1 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">buffer b2 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">buffer b3 = buffer();</span></p>
<p><span style=\"font-family: monospace;\">Real msg[2] = {2,3};</span></p>
<p><span style=\"font-family: monospace;\">Real msg2[2],msg3[2];</span></p>
<p><span style=\"font-family: monospace;\">...</span></p>
<p><span style=\"font-family: monospace;\">initial algorithm</span></p>
<p><span style=\"font-family: monospace;\">couple(b1,b2);</span></p>
<p><span style=\"font-family: monospace;\">couple(b2,b3);</span></p>
<p><span style=\"font-family: monospace;\">algorithm</span></p>
<p><span style=\"font-family: monospace;\">bput(msg,b1);</span></p>
<p><span style=\"font-family: monospace;\">bsend(b1);</span></p>
<p><span style=\"font-family: monospace;\">msg2 = bread(b2,2); // msg2 = {0,0}, since msg is transmitted directly to b3</span></p>
<p><span style=\"font-family: monospace;\">msg3 = bread(b3,2); // msg3 = {2,3}</span></p>
</html>"));
    end bsend;

  model InPort "Input Port"
    input Real M; // number of received messages
    buffer B = buffer(); // buffer that contains received messages
    Boolean rcv; // message reception flag
    protected
    Integer nmsg;
  equation
    nmsg = integer(M);
    rcv = nmsg <> pre(nmsg);
      annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}), Diagram(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}),
        Documentation(info="<html>
<p>Port used to define an input point for incomming messages in a model.</p>
<p>It includes:</p>
<ul>
<li><span style=\"font-family: monospace;\">B</span>, buffer used as container for the received messages.</li>
<li><span style=\"font-family: monospace;\">M</span>, used to synchronize the communication of messages.</li>
<li><span style=\"font-family: monospace;\">rcv</span>, used as a boolean flag to observe and detect the reception of messages.</li>
</ul>
<p><br>When new messages are received the flag <span style=\"font-family: monospace;\">rcv</span> becomes true. This flag can be used as condition in a when statement for managing the reception of messages.</p>
<p>Received messages are available in the buffer <span style=\"font-family: monospace;\">B</span> and can be managed using the corresponding functions (<span style=\"font-family: monospace;\">bsize</span>, <span style=\"font-family: monospace;\">bget</span>, <span style=\"font-family: monospace;\">bread</span>, <span style=\"font-family: monospace;\">bwrite</span>, etc.).</p>
</html>"));
  end InPort;

  model Driver
    Real M; // number of messages sent
    outer buffer B; // buffer used to transmit messages
    discrete input Real tSend(start=Modelica.Constants.inf, fixed=true); // time to send output
    parameter Integer msglen;
    parameter Boolean bag =  false;
    input Real msg[msglen]; // output message
    Boolean phase_fired;
    Boolean phase_active;
    Boolean phase_passive(start = false, fixed=true);
    Boolean event0 = time >= pre(tSend) and initial();
  initial equation
     pre(phase_fired) = time < pre(tSend);
     pre(phase_active) = time >= pre(tSend);
  equation
    phase_passive = pre(phase_fired) and tSend <> pre(tSend) or pre(phase_passive) and not
                                                                                          (time >= pre(tSend));
    phase_active = (pre(phase_passive) and event0) or (pre(phase_passive) and (time >= pre(tSend)));
    phase_fired = pre(phase_active) or pre(phase_fired) and tSend == pre(tSend);

  algorithm
    when phase_active then
      //Modelica.Utilities.Streams.print(String(time)+": driver active");
      if not bag then
        bput(pre(msg), B);
      end if;
      bsend(B);
      M := pre(M) + 1;
    end when;
      annotation (Documentation(info="<html>
<p>This model is used to support multiple transmissions at the same time instant. It is used in the <span style=\"font-family: monospace;\">OutPort</span> model, but it is not intented to be used in other models.</p>
</html>"));
  end Driver;

  model OutPort "Output Port"
    parameter Integer msglen = 2;
    parameter Integer nDrivers = 4; // number of drivers in the port
    discrete input Real tSend(start=Modelica.Constants.inf, fixed=true); // time to send output
    input Boolean snd; // boolean flag that activates driver to send output message
    Real M; // number of messages sent
    inner buffer B=buffer();  // buffer used to transmit messages
    protected
    Driver D[nDrivers](each msglen=msglen,each bag=true);
    Integer activeDriver; // number of driver currently active in the port

  equation
    for i in 1:nDrivers loop
      when change(snd) then
        if i == activeDriver then
          D[i].tSend = tSend;
        else
          D[i].tSend = Modelica.Constants.inf;
        end if;
      end when;
      D[i].msg = zeros(msglen);
    end for;
    M =  sum(D[i].M for i in 1:nDrivers);

  algorithm
     when change(snd) then
       if tSend > pre(tSend) then
         activeDriver:= 1;
       else
         activeDriver := pre(activeDriver) +1;
       end if;
     end when;

      annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}), Diagram(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}),
        Documentation(info="<html>
<p>Port used to define an output point for outgoing messages in a model. </p>
<p>This port supports the <b>transmission of a bag of output messages per time instant, but multiple messages can be sent during the same instant in multiple iterations</b>. The transmission of a the bag is scheduled at time <span style=\"font-family: monospace;\">tSend</span> by activating the flag <span style=\"font-family: monospace;\">snd</span> (switching its current value, e.g., <span style=\"font-family: monospace;\">snd = not snd</span>). The bag has to be prevously created by inserting messages into the buffer <span style=\"font-family: monospace;\">B</span>. The first driver model of the array is used for the first transmission in the current time instant.</p>
<p>If further messages need to be sent during the same time instant (e.g., maybe due to the occurrence of other events in the model that may trigger the transmission of additional messages), the next driver of the array is used. Further transmissions are activated by additional changes in the snd flag. New bags of output messages need to be inserted in the buffer previously to the modification of the <span style=\"font-family: monospace;\">snd</span> flag.</p>
<p><br>It includes:</p>
<ul>
<li><span style=\"font-family: monospace;\">msglen</span>, defines the size of the messages stored in the buffer.</li>
<li><span style=\"font-family: monospace;\">nDrivers</span>, parameter that defines the number of drivers of the array (i.e., the maximum number of subsequent outputs that can be sent during the same instant). </li>
<li><span style=\"font-family: monospace;\">tSend</span>, used to schedule the time event for the transmission of the message.</li>
<li><span style=\"font-family: monospace;\">snd</span>, used to activate the transmisstion of messages in subsequent iterations during each time instant.</li>
<li><span style=\"font-family: monospace;\">M</span>, is used to synchronize the transmission between the output port and the input port.</li>
<li><span style=\"font-family: monospace;\">B</span>, is the buffer used as container for the output message.</li>
</ul>
</html>"));
  end OutPort;

  model RInPort = InPort "Router Input Port" annotation (Documentation(info="<html>
<p>Port used to define input &quot;router&quot; ports. These are ports that define the external interface of a model and are directly coupled to input ports of internal components of the model.</p>
<p>These ports should only be used to define communication channels (i.e., couplings).</p>
</html>"));

  model ROutPort "Router Output Port"
    Real M;
    buffer B = buffer();
      annotation (Icon(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,60},{80,-40}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}), Diagram(graphics={
          Rectangle(
            extent={{-100,100},{-80,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={90,0},
            rotation=180,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Rectangle(
            extent={{-10,100},{10,-100}},
            fillColor={255,0,0},
            fillPattern=FillPattern.Solid,
            origin={0,-90},
            rotation=90,
            pattern=LinePattern.None,
            lineColor={0,0,0}),
          Text(
            extent={{-80,58},{80,-42}},
            lineColor={0,0,0},
            fillColor={244,125,35},
            fillPattern=FillPattern.None,
            textString="%name")}),
        Documentation(info="<html>
<p>Port used to define output &quot;router&quot; ports. These are ports that define the external interface of a model and are directly coupled to output ports of internal components of the model.</p>
<p>These ports should only be used to define communication channels (i.e., couplings).</p>
</html>"));
  end ROutPort;

    annotation (Documentation(info="<html>
<p>This package supports MPC for messages of <span style=\"font-family: monospace;\">Real[]</span> type.</p>
</html>"));
  end BufferArray;

  package Examples "Testing cases and illustration examples"
    model simpleReal "simple test case using BufferReal"
      import MSGLib.BufferReal.*;
      buffer b=buffer();
      Real out;
      Real x[2];
      Real s1,s2;
    algorithm
      // First event at time 1
      when time >= 1 then
        // two new messages inserted in the buffer
        bput(1, b);
        bput(2, b);
        // read contents of the buffer
        s1 := bread(b, 1);
        s2 := bread(b, 2);
        Modelica.Utilities.Streams.print("CONTENTS of B:"+String(s1)+","+String(s2));
        // extract last message from the buffer
        out := bget(b);
        Modelica.Utilities.Streams.print("GET:"+String(out));
        x[1] := out;
        // read contents of the buffer (0 returned for missing messages)
        s1 := bread(b, 1);
        s2 := bread(b, 2);
        Modelica.Utilities.Streams.print("CONTENTS of B:"+String(s1)+","+String(s2));
        // extract last message from the buffer
        out := bget(b);
        Modelica.Utilities.Streams.print("GET:"+String(out));
        x[2] := out;
        // read contents of the buffer (0 returned for missing messages)
        s1 := bread(b, 1);
        s2 := bread(b, 2);
        Modelica.Utilities.Streams.print("CONTENTS of B:"+String(s1)+","+String(s2));
      end when;
      // Second event at time 2
      when time >= 2 then
        Modelica.Utilities.Streams.print("PUT :1,2");
        bput(1, b);
        bput(2, b);
        // extract first message from the buffer
        x[1] := bget(b,1);
        x[2] := bget(b,1);
        Modelica.Utilities.Streams.print("GET :"+String(x[1])+","+String(x[2]));
      end when;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(StopTime = 3),
        Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a simple test case where a buffer is used as storage of messages of Real type.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model behaves as follows (see execution log to observe the printed output):</p>
<ol>
<li>At <span style=\"font-family: monospace;\">time == 1</span>, two messages, first &quot;1&quot; and then &quot;2&quot; are inserted in the buffer.</li>
<li>The value of these messages is read using <span style=\"font-family: monospace;\">bread</span> and assigned to variables <span style=\"font-family: monospace;\">s1</span> and <span style=\"font-family: monospace;\">s2</span>, that are used to print the current contents of the buffer. Note the diferent values for <span style=\"font-family: monospace;\">index</span> in each call to <span style=\"font-family: monospace;\">bread</span>, in order to observe both messages.</li>
<li>The last message is extracted from the buffer using <span style=\"font-family: monospace;\">bget</span>, and its value is assigned to<span style=\"font-family: monospace;\"> x[1].</span></li>
<li>The contents of the buffer are again read and printed. Now, the buffer only has one message and then a 0 is returned and printed for the missing one.</li>
<li>The remaining message is extracted using <span style=\"font-family: monospace;\">bget</span> and assigned to <span style=\"font-family: monospace;\">x[2]</span>.</li>
<li>The contents of the buffer, now emtpy, are read and printed again.</li>
<li>At <span style=\"font-family: monospace;\">time == 2</span>, two new messages are inserted in the buffer, and they are inmediately extracted and assigned to<span style=\"font-family: monospace;\"> x[1]</span> and <span style=\"font-family: monospace;\">x[2]</span>, respectively. Note that in this case the first message of the buffer is extracted every time, by setting the <span style=\"font-family: monospace;\">index</span> parameter to 1.</li>
</ol>
</html>"));
    end simpleReal;

    model simpleArray "simple test case using BufferArray"
      import MSGLib.BufferArray.*;
      buffer b=buffer();
      Real out[2];
      Real u1[2] = {1, 2};
      Real u2[2] = {3,4};
      Real y1[2],y2[2];
    algorithm
      // first event at time == 1
      when time >= 1 then
        // insert two messages in the buffer
        Modelica.Utilities.Streams.print("ADD "+String(u1[1])+","+String(u1[2]));
        bput(u1, b);
        Modelica.Utilities.Streams.print("ADD "+String(u2[1])+","+String(u2[2]));
        bput(u2, b);
        // read both messages and print the content
        y1 := bread(b, 2,1);
        y2 := bread(b, 2,2);
        Modelica.Utilities.Streams.print("CONTENTS of B:{"+String(y1[1])+","+String(y1[2])+"};{"+String(y2[1])+","+String(y2[2])+"}");
        // extract last message and print content again (0 is returned for missing messages)
        out := bget(b, 2);
        Modelica.Utilities.Streams.print("GET:"+String(out[1])+","+String(out[2]));
        y1 :=bread(
          b,
          2,
          1);
        y2 :=bread(
          b,
          2,
          2);
        Modelica.Utilities.Streams.print("CONTENTS of B:{"+String(y1[1])+","+String(y1[2])+"};{"+String(y2[1])+","+String(y2[2])+"}");
        // extract remaining message and print content again (0 is returned for missing messages)
        out := bget(b, 2);
        Modelica.Utilities.Streams.print("GET:"+String(out[1])+","+String(out[2]));
        y1 :=bread(
          b,
          2,
          1);
        y2 :=bread(
          b,
          2,
          2);
        Modelica.Utilities.Streams.print("CONTENTS of B:{"+String(y1[1])+","+String(y1[2])+"};{"+String(y2[1])+","+String(y2[2])+"}");
      end when;
      // first event at time == 2
      when time >= 2 then
        // insert two messages
        bput(u1, b);
        bput(u2, b);
        // extract first message
        y1 := bget(b, 2,1);
        Modelica.Utilities.Streams.print("GET:"+String(y1[1])+","+String(y1[2]));
        // extract first message again
        y2 := bget(b, 2,1);
        Modelica.Utilities.Streams.print("GET:"+String(y2[1])+","+String(y2[2]));
      end when;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(StopTime = 3),
        Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a simple test case where a buffer is used as storage of messages of Array type.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model is analogous to <span style=\"font-family: monospace;\">simpleReal</span>, but using Array messages in this case. The behavior is as follows:</p>
<ol>
<li>At <span style=\"font-family: monospace;\">time == 1</span>, two messages are inserted in the buffer.</li>
<li>The value of these messages is read using bread and assigned to variables <span style=\"font-family: monospace;\">y1</span> and <span style=\"font-family: monospace;\">y2</span>, that are used to print the current contents of the buffer. Note the diferent values for <span style=\"font-family: monospace;\">index</span> in each call to <span style=\"font-family: monospace;\">bread</span>, in order to observe both messages.</li>
<li>The last message is extracted from the buffer using bget, and its value is assigned to <span style=\"font-family: monospace;\">out</span>.</li>
<li>The contents of the buffer are again read and printed. Now, the buffer only has one message and then a 0 is returned and printed for the missing one.</li>
<li>The remaining message is extracted using <span style=\"font-family: monospace;\">bget</span> and assigned to <span style=\"font-family: monospace;\">out</span>.</li>
<li>The contents of the buffer, now emtpy, are read and printed again.</li>
<li>At <span style=\"font-family: monospace;\">time == 2</span>, two new messages are inserted in the buffer, and they are inmediately extracted and assigned to y1 and y2, respectively. Note that in this case the first message of the buffer is extracted every time, by setting the index parameter to 1.</li>
</ol>
</html>"));
    end simpleArray;

    model simplePorts "simple MPC communication test case"
      import MSGLib.BufferReal.*;
      OutPort Origin;
      InPort Destination;
      Real msg;
    initial algorithm
        couple(Origin.B, Destination.B);
    equation
      Origin.M = Destination.M;
    algorithm
      when sample(0, 1) then
        bput(time+0.2,Origin.B);
        Origin.tSend :=time;
        Origin.snd := not Origin.snd;
        Modelica.Utilities.Streams.print(String(time) + ": msg sent = " + String(time+0.2));
      end when;
    algorithm
      when Destination.rcv then
        msg := bget(Destination.B);
        Modelica.Utilities.Streams.print(String(time) + ": msg received = " + String(msg));
      end when;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio = false)),
        Diagram(coordinateSystem(preserveAspectRatio = false)),
        experiment(StopTime = 10),
        Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a simple test case for message passing communication.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;Origin;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;Destination;</p>
<h4>BEHAVIOR</h4>
<p>This model defines a communication channel between two ports, <span style=\"font-family: monospace;\">Origin</span> and <span style=\"font-family: monospace;\">Destination</span>.</p>
<p>Both ports are coupled using the <span style=\"font-family: monospace;\">couple</span> function with their corresponding buffers (<span style=\"font-family: monospace;\">Origin.B</span> and <span style=\"font-family: monospace;\">Destination.B</span>), within the initial algorithm section of the model. The value of the <span style=\"font-family: monospace;\">M</span> variables of both ports are equaled (<span style=\"font-family: monospace;\">Origin.M = Destination.M</span>) since the <span style=\"font-family: monospace;\">Destination</span> port only has <span style=\"font-family: monospace;\">Origin</span> as coupled source of messages.</p>
<p>Using the <span style=\"font-family: monospace;\">sample</span> operator, a periodic transmission of messages is scheduled with an interval of 1 s. Messages are inserted in the output buffer (Origin.B) and are inmediately transmitted by setting <span style=\"font-family: monospace;\">Origin.tSend</span> to the current time and activating the corresponding flag <span style=\"font-family: monospace;\">Origin.snd</span>.</p>
<p>The reception of messages at the <span style=\"font-family: monospace;\">Destination</span> port is performed observing the value of <span style=\"font-family: monospace;\">Destination.rcv</span> as the condition of a when clause. When the clause becomes active, the received message is extracted from the buffer (<span style=\"font-family: monospace;\">Destination.B</span>)<b> </b>using the <span style=\"font-family: monospace;\">bget</span> function and printed.</p>
</html>"));
    end simplePorts;

    package Testing "Testing cases in combination with other Modelica functionality"
      model tReinitCommAlg "MPC communication within an algorithm section and at a time event"
        import MSGLib.BufferReal.*;
        Real x;
        OutPort outb;
        InPort inb;

      initial algorithm
        couple(outb.B,inb.B);

      equation
          der(x) = 2;
          outb.M = inb.M;

      algorithm
        when sample(1,1) then
          reinit(x,time);
          // message transmission
          bput(pre(x),outb.B);
          outb.tSend := time;
          outb.snd := not pre(outb.snd);
        end when;


      algorithm
         when inb.rcv then // reception of messages
           Modelica.Utilities.Streams.print(String(time) + ": PRE X =" + String(bget(inb.B)));
         end when;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model combines the transmission of messages with the use of the reinit operator within an algorithm section.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;outb;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;inb;</p>
<h4>BEHAVIOR</h4>
<p>Messages are periodically sent from <span style=\"font-family: monospace;\">outb</span> to <span style=\"font-family: monospace;\">inb.</span> </p>
<p><span style=\"font-family: monospace;\">pre(x)</span> is used as value for the transmitted messages, while a reinit of the variable <span style=\"font-family: monospace;\">x</span> is performed simultaneously to the communication.<span style=\"font-family: monospace;\"> </span></p>
<p>Plot the value of <span style=\"font-family: monospace;\">x</span> to better observe the value of the transmitted messages.</p>
</html>"));
      end tReinitCommAlg;

      model tReinitCommEq "MPC communication within an equation section and at a time event"
        import MSGLib.BufferReal.*;
        Real x;
        OutPort outb;
        InPort inb;
      initial algorithm
        couple(outb.B,inb.B);
      equation
        outb.M = inb.M;
        der(x) = 2;

        when sample(1,1) then
          reinit(x,time);
          // message transmission
          bput(pre(x),outb.B);
          outb.tSend = time;
          outb.snd =  not pre(outb.snd);
        end when;

        when inb.rcv then // reception of messages
          Modelica.Utilities.Streams.print(String(time) + ": PRE X =" +
            String(BufferReal.bget(inb.B)));
        end when;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model combines the transmission of messages with the use of the <span style=\"font-family: monospace;\">reinit</span> operator within an equation section.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;outb;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;inb;</p>
<h4>BEHAVIOR</h4>
<p>Messages are periodically sent from <span style=\"font-family: monospace;\">outb</span> to <span style=\"font-family: monospace;\">inb</span>. </p>
<p><span style=\"font-family: monospace;\">pre(x)</span> is used as value for the transmitted messages, while a <span style=\"font-family: monospace;\">reinit</span> of the variable x is performed simultaneously to the communication. </p>
<p>Plot the value of x to better observe the value of the transmitted messages.</p>
</html>"));
      end tReinitCommEq;

      model sReinitCommAlg "MPC communication within an algorithm section and an state event"
        import MSGLib.BufferReal.*;
        Real x;
        OutPort outb;
        InPort inb;

      initial algorithm
        couple(outb.B,inb.B);

      equation
          der(x) = 2;
          outb.M = inb.M;

      algorithm
        when x>1 then
          reinit(x,time);
          // message transmission
          bput(pre(x),outb.B);
          outb.tSend :=time;
          outb.snd := not pre(outb.snd);
        end when;


      algorithm
         when inb.rcv then // message reception
          Modelica.Utilities.Streams.print(String(time) + ": PRE X =" +String(bget(inb.B)));
         end when;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is analogous to tReinitCommAlg, but in this case message transmissions are triggered using state events.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;outb;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;inb;</p>
<h4>BEHAVIOR</h4>
<p>Messages are sent from <span style=\"font-family: monospace;\">outb</span> to <span style=\"font-family: monospace;\">inb, </span>when the value of x becomes greater than 1. </p>
<p><span style=\"font-family: monospace;\">pre(x)</span> is used as value for the transmitted messages, while a reinit of the variable <span style=\"font-family: monospace;\">x</span> is performed simultaneously to the communication. </p>
<p>Multiple events are triggered until the event detection threshold is passed. Plot the value of <span style=\"font-family: monospace;\">x</span> to better observe the value of the transmitted messages.</p>
</html>"));
      end sReinitCommAlg;

      model sReinitCommEq "MPC communication within an equation section and an state event"
        import MSGLib.BufferReal.*;
        Real x;
        OutPort outb;
        InPort inb;
      initial algorithm
        couple(outb.B,inb.B);
      equation
        outb.M = inb.M;
        der(x) = 2;

        when x > 1 then
          reinit(x,time);
          // message transmission
          bput(pre(x),outb.B);
          outb.tSend = time;
          outb.snd = not pre(outb.snd);
        end when;

        when inb.rcv then // message reception
          Modelica.Utilities.Streams.print(String(time) + ": PRE X =" +String(bget(inb.B)));
        end when;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is analogous to <span style=\"font-family: monospace;\">tReinitCommEq</span>, but in this case message transmissions are triggered using state events.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;outb;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;inb;</p>
<h4>BEHAVIOR</h4>
<p>Messages are sent from <span style=\"font-family: monospace;\">outb</span> to <span style=\"font-family: monospace;\">inb</span>, when the value of <span style=\"font-family: monospace;\">x</span> becomes greater than 1.<span style=\"font-family: monospace;\"> </span></p>
<p><span style=\"font-family: monospace;\">pre(x)</span> is used as value for the transmitted messages, while a <span style=\"font-family: monospace;\">reinit</span> of the variable <span style=\"font-family: monospace;\">x</span> is performed simultaneously to the communication. </p>
<p>Multiple events are triggered until the event detection threshold is passed. Plot the value of <span style=\"font-family: monospace;\">x</span> to better observe the value of the transmitted messages.</p>
</html>"));
      end sReinitCommEq;

      model tReinitBuffAlg "Message storage within an algorithm section and at a time event"
        import MSGLib.BufferReal.*;
        Real x;
        buffer out=buffer();
        buffer outpre=buffer();
        Integer s;

      equation
        der(x) = 2;

      algorithm
        when sample(1,1) then
          reinit(x,time);
          // insertion of messages
          bput(x, out); // in this case, x <> pre(x) because reinit is performed before the insertion
          bput(pre(x), outpre);
        end when;

      algorithm
       when terminal() then
         // extraction of messages
          s := bsize(out);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("x_eq["+String(i)+"] = " + String(bget(out)));
          end for;
          s := bsize(outpre);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("pre(x)["+String(i)+"] = " + String(bget(outpre)));
          end for;
        end when;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>In this model the functionality of a buffer to be used as temporal storage for messages is illustrated. </p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>Messages are periodically inserted in the buffers. The value of <span style=\"font-family: monospace;\">x</span> is inserted in <span style=\"font-family: monospace;\">out</span> and <span style=\"font-family: monospace;\">pre(x)</span> is in <span style=\"font-family: monospace;\">outpre</span>. </p>
<p>Message insertions are combined with the use of the <span style=\"font-family: monospace;\">reinit</span> operator to observe its impact in the values stored in the buffer. This operatios are perfomed within an algorithm section. </p>
<p>At the end of the simulation, stored messages are extracted from the buffer and printed. Since in the algorithm section the <span style=\"font-family: monospace;\">reinit</span> is performed before the insertion of the messages the values of <span style=\"font-family: monospace;\">x</span> and <span style=\"font-family: monospace;\">pre(x)</span> are different as shown in the series of stored values (cf. simulation log).</p>
</html>"));
      end tReinitBuffAlg;

      model tReinitBuffEq "Message storage within an equation section and at a time event"
        import MSGLib.BufferReal.*;
        Real x;
        buffer out=buffer();
        buffer outpre=buffer();
        Integer s;

      equation
        der(x) = 2;
        when sample(1,1) then
          reinit(x,time);
          // insertion of messages
          bput(x, out); // in this case, x == pre(x) because reinit is performed at the end of the event
          bput(pre(x), outpre);
        end when;

      algorithm
        when terminal() then
          // extraction of messages
          s := bsize(out);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("x["+String(i)+"] = " + String(bget(out)));
          end for;
          s := bsize(outpre);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("pre(x)["+String(i)+"] = " + String(bget(outpre)));
          end for;
        end when;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>In this model the functionality of a buffer to be used as temporal storage for messages is illustrated.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port.</p>
<h4>BEHAVIOR</h4>
<p>Messages are periodically inserted in the buffers. The value of <span style=\"font-family: monospace;\">x</span> is inserted in <span style=\"font-family: monospace;\">out</span> and <span style=\"font-family: monospace;\">pre(x)</span> is inserted in <span style=\"font-family: monospace;\">outpre</span>. </p>
<p>Message insertions are combined with the use of the <span style=\"font-family: monospace;\">reinit</span> operator to observe its impact in the values stored in the buffer. This operatios are perfomed within an equation section.</p>
<p>At the end of the simulation, stored messages are extracted from the buffer and printed. Since in the equation section the <span style=\"font-family: monospace;\">reinit</span> is performed at the end of the event iteration, the insertion of the messages the values of x and pre(x) are the same, as shown in the series of stored values (cf. simulation log).</p>
</html>"));
      end tReinitBuffEq;

      model sReinitBuffEq "Message storage using two buffers, and x updated with reinit"
        import MSGLib.BufferReal.*;
        Real x;
        buffer out=buffer();
        buffer outpre=buffer();
        Integer s;

      equation
        der(x) = 2;
        when x > 1 then
          reinit(x,time);
          // message insertions
          bput(x, out);
          bput(pre(x), outpre);
        end when;

      algorithm
        // message extraction
        when terminal() then
          s := bsize(out);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("x = " + String(bget(out)));
          end for;
          s := bsize(outpre);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("pre(x) = " + String(bget(outpre)));
          end for;
        end when;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is analogous to <span style=\"font-family: monospace;\">tReinitBuffEq</span>, but in this case message transmissions are triggered using state events.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>Messages are inserted in the buffer every time the value of x is greater than 1. The value of x is inserted in out and pre(x) is inserted in outpre. </p>
<p>Message insertions are combined with the use of the reinit operator to observe its impact in the values stored in the buffer. This operatios are perfomed within an equation section.</p>
<p>At the end of the simulation, stored messages are extracted from the buffer and printed. Similarly to the behavior of <span style=\"font-family: monospace;\">tReinitBuffEq</span>, the values stored in <span style=\"font-family: monospace;\">out</span> and <span style=\"font-family: monospace;\">outpre</span> are the same, since the reinit is performed at the end of the event iteration (cf. simulation log).</p>
</html>"));
      end sReinitBuffEq;

      model tUpdateBuffEq "Message storage using two buffers, and x updated in an equation"
          import MSGLib.BufferReal.*;
        Real x;
        buffer out=buffer();
        buffer outpre=buffer();
        Integer s;

      equation
        when sample(1,1) then
          // insertion of messages in the buffers
          bput(x, out); // note that x = pre(x)+1 is performed before this bput
          bput(pre(x), outpre);
          // update x
          x = pre(x) +1;
        end when;

      algorithm
        // extraction of messages
        when terminal() then
          s := bsize(out);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("x = " + String(bget(out)));
          end for;
          s := bsize(outpre);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("pre(x) = " + String(bget(outpre)));
          end for;
        end when;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is analogous to <span style=\"font-family: monospace;\">sReinitBuffEq</span>, but in this case an update equation is used instead of <span style=\"font-family: monospace;\">reinit</span>.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>Messages are inserted in the buffer every time the value of <span style=\"font-family: monospace;\">x</span> is greater than 1. The value of <span style=\"font-family: monospace;\">x</span> is inserted in <span style=\"font-family: monospace;\">out</span> and <span style=\"font-family: monospace;\">pre(x)</span> is inserted in <span style=\"font-family: monospace;\">outpre</span>. </p>
<p>Message insertions are combined with an update equation for <span style=\"font-family: monospace;\">x</span> (<span style=\"font-family: monospace;\">x = pre(x)+1</span>) to observe its impact in the values stored in the buffer. This operatios are perfomed within an equation section.</p>
<p>At the end of the simulation, stored messages are extracted from the buffer and printed. In this case, the update of x is evaluated before the insertion of the message in out (cf. simulation log). Thus, to guarrantee the value of the message inserted in a buffer, only known values of the model variables (constants and <span style=\"font-family: monospace;\">pre()</span> values) should be used.</p>
</html>"));
      end tUpdateBuffEq;

      model tN1Comm "N-1 communication between two output ports and one input port"
          import MSGLib.BufferReal.*;
        Real x;
        OutPort outb1;
        OutPort outb2;
        InPort inb;
        Integer s;
      initial algorithm
        couple(outb1.B,inb.B);
        couple(outb2.B,inb.B);

      equation
        outb1.M + outb2.M = inb.M;

        when sample(1,1) then
          // generation of message
          bput(pre(x),outb1.B);
          outb1.tSend = time;
          outb1.snd = not pre(outb1.snd);
        end when;

      algorithm
        when sample(1,1) then
          // generation of message
          bput(pre(x),outb2.B);
          outb2.tSend := time;
          outb2.snd :=not pre(outb2.snd);
          // update x
          x :=pre(x) + 1;
        end when;

      equation
        // reception of messages
      algorithm
         when inb.rcv then
           s := bsize(inb.B);
           for i in 1:s loop
            Modelica.Utilities.Streams.print(String(time) + ": PRE X =" + String(bget(inb.B)));
           end for;
         end when;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model describes two communication channels, describing an N-to-1 communication. Two output ports are coupled to a single input port.</p>
<p><b>MPC INTERFACE</b> </p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;outb1;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;outb2;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;inb; </p>
<h4>BEHAVIOR</h4>
<p><br>The <span style=\"font-family: monospace;\">couple</span> function is used to describe both couplings (<span style=\"font-family: monospace;\">outb1</span>-&gt;<span style=\"font-family: monospace;\">inb</span> and <span style=\"font-family: monospace;\">outb2</span>-&gt;<span style=\"font-family: monospace;\">inb</span>). Also, the sum of the <span style=\"font-family: monospace;\">M</span> variables of <span style=\"font-family: monospace;\">outb1</span> and <span style=\"font-family: monospace;\">outb2</span> is assigned to <span style=\"font-family: monospace;\">inb</span>, as both ports are sources for <span style=\"font-family: monospace;\">inb</span>.</p>
<p>Messages are generated using two <span style=\"font-family: monospace;\">sample</span> operators, with the same period, inside <span style=\"font-family: monospace;\">when</span> statements. One <span style=\"font-family: monospace;\">when</span> statement is defined within an equation section and the other within an algorithm section to illustrate both uses. The value of the messages is obtained from the value of <span style=\"font-family: monospace;\">x</span>, which is updated after the tranmission of the messages. </p>
<p>Messages received are extracted and printed. Note that two messages are received per time instant, so a <span style=\"font-family: monospace;\">for</span> loop is used to extract them.</p>
</html>"));
      end tN1Comm;

      model Loop
        import MSGLib.BufferReal.*;
        InPort in1,in2,in3;
        OutPort out1,out2,out3;
        Integer count1(start=0),count2(start=0),count3(start=0);
        Real x1,x2,x3;
        Real msg1,msg2,msg3;
      initial algorithm
        couple(out1.B,in2.B);
        couple(out2.B,in3.B);
        couple(out3.B,in1.B);
      equation
        out1.M = in2.M;
        out2.M = in3.M;
        out3.M = in1.M;

        // M1
      algorithm
        when sample(1,1) then
          Modelica.Utilities.Streams.print(String(time)+": M1 sends "+String(x1));
          count1 := count1 +1;
          bput(pre(x1),out1.B);
          out1.tSend := time;
          out1.snd := not pre(out1.snd);
        end when;

        when in1.rcv then
          msg1 := bget(in1.B);
          count1 := count1 +1;
          Modelica.Utilities.Streams.print(String(time)+": M1 receives "+String(msg1)+" counter = "+String(count1));
          if count1 < 4 then
              Modelica.Utilities.Streams.print(String(time)+": M1 sends "+String(msg1)+" counter = "+String(count1));
              bput(pre(msg1),out1.B);
              out1.tSend := time;
              out1.snd := not pre(out1.snd);
          else
            reinit(x1,msg1);
            count1 := 0;
            Modelica.Utilities.Streams.print("---- LOOP END IN M1 ---- count "+String(count1));
          end if;
        end when;

         // M2
      algorithm
        when in2.rcv then
          msg2 := bget(in2.B);
          count2 := count2 +1;
          Modelica.Utilities.Streams.print(String(time)+": M2 receives "+String(msg2)+" counter = "+String(count2));
          if count2 < 4 then
              Modelica.Utilities.Streams.print(String(time)+": M2 sends "+String(msg2)+" counter = "+String(count2));
              bput(pre(msg2),out2.B);
              out2.tSend := time;
              out2.snd := not pre(out2.snd);
          else
            reinit(x2,msg2);
            count2 := 0;
            Modelica.Utilities.Streams.print("---- LOOP END IN M3 ---- count "+String(count2));
          end if;
        end when;

        // M3
      algorithm
        when in3.rcv then
          msg3 := bget(in3.B);
          count3 := count3 +1;
          Modelica.Utilities.Streams.print(String(time)+": M3 receives "+String(msg3)+" counter = "+String(count3));
          if count3 < 4 then
              Modelica.Utilities.Streams.print(String(time)+": M3 sends "+String(msg3)+" counter = "+String(count3));
              bput(pre(msg3),out3.B);
              out3.tSend := time;
              out3.snd := not pre(out3.snd);
          else
            reinit(x3,msg3);
            count3 := 0;
            Modelica.Utilities.Streams.print("---- LOOP END IN M3 ---- count "+String(count3));
          end if;
        end when;

      equation
        der(x1) = 1;
        der(x2) = 2;
        der(x3) = 3;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5.1),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model represents three model compoments coupled in a ring (e.g., M1 -&gt; M2 -&gt; M3 -&gt; M1). The objective is to test how the communication of messages is performed along the ring structure.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;in1,in2,in3;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;out1,out2,out3;</p>
<h4>BEHAVIOR</h4>
<p><br>Each compoment includes an input port and an output port. It also includes a continuous-time variable, <span style=\"font-family: monospace;\">x</span>, whose dynamic is defined in an equation section. The value of <span style=\"font-family: monospace;\">x </span>in each component is used to generate the transmitted messages. Also, each component includes a discrete variable used as a counter.</p>
<p>The discrete-event behavior of each compoment is specified in an algorithm section:</p>
<ul>
<li><span style=\"font-family: monospace;\">M1</span>: includes the management of two events: a time event defined using a <span style=\"font-family: monospace;\">sample</span> operator that is used to periodically send output messages (i.e., one output message per second); and a when statement used to manage the reception of input messages. When a message is received the counter is increased and if the counter is smaller than 4, the received message is forwarded through the output port. Otherwise, the counter is reset to 0 and the value of <span style=\"font-family: monospace;\">x</span> is reinit. In this case no output message is sent, so the chain of transmissions is stopped.</li>
<li><span style=\"font-family: monospace;\">M2</span> and <span style=\"font-family: monospace;\">M3</span>: only include the management of input messages, analogously to the behavior described for M1. </li>
</ul>
<p><br><span style=\"font-family: monospace;\">M1</span> generates an output message every second. That message performs three loops along the ring of components, since its initial value of <span style=\"font-family: monospace;\">count = 0</span>. </p>
<p>Successive message transmissions will perform different loops in the ring, depending on the values of the counters in each component since only the counter of the component that stops the transmission is reset to 0. </p>
<p>This behavior is supported by the array of <span style=\"font-family: monospace;\">Driver</span> models included in the <span style=\"font-family: monospace;\">OutPort</span>, because a different driver in the port is used for each successive transmission during the same time instant.</p>
</html>"));
      end Loop;

      model loopModular
        import MSGLib.BufferReal.*;
        LoopModular.M m1(derx=1, name="M1");
        LoopModular.M m2(
          start=false,
          derx=2,
          name="M2");
        LoopModular.M m3(
          start=false,
          derx=3,
          name="M3");
      initial algorithm
          couple(m1.OUT.B,m2.IN.B);
          couple(m2.OUT.B,m3.IN.B);
          couple(m3.OUT.B,m1.IN.B);
      equation
        m1.OUT.M = m2.IN.M;
        m2.OUT.M = m3.IN.M;
        m3.OUT.M = m1.IN.M;
        //0 = m1.IN.M;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=5.1),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model duplicates the behavior of the Loop model, by including three M compomnents from the <span style=\"font-family: monospace;\">LoopModular</span> package (M1, M2 and M3). These internal components are interconnected in a ring topology. </p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port.</p>
<h4>BEHAVIOR</h4>
<p>M1 is configured with <span style=\"font-family: monospace;\">start=true</span>, to generate periodical messages, while M2 and M3 are passive and only respond to the received inputs.</p>
<p>The behavior is analogous to that of the Loop model, where messages perform loops in the ring until one of the counters of the components reaches the maximum value. Note that if the number of <span style=\"font-family: monospace;\">Driver</span> models in each <span style=\"font-family: monospace;\">OutPort</span> is reduced (e.g., <span style=\"font-family: monospace;\">nDrivers = 2</span>, instead of <span style=\"font-family: monospace;\">maxcount</span>) the desired behavior is no longer obtained because at that point there are not enough Drivers to forward the messages for the required number of loops.</p>
</html>"));
      end loopModular;

      package LoopModular

        model M
          import MSGLib.BufferReal.*;
          InPort IN;
          OutPort OUT(nDrivers=maxcount);
          parameter Integer maxcount = 4;
          Integer count(start=0);
          Real x;
          Real msg;
          parameter String name = "M1";
          parameter Real derx = 1;
          parameter Boolean start = true;

          // M1
        algorithm
          // mensaje inicial
          when sample(1,1) and start then
            count := pre(count)+1;
            Modelica.Utilities.Streams.print(String(time)+": "+name+" START count = "+String(count)+" sends "+String(pre(x)));
            bput(pre(x),OUT.B);
            OUT.tSend := time;
            OUT.snd := not pre(OUT.snd);
          end when;

          // recepcion de mensajes
          when IN.rcv then
            // lectura del mensaje
            Modelica.Utilities.Streams.print(String(time)+": "+name+" phase active ** bsize= "+String(bsize(IN.B)));
            if bsize(IN.B) > 0 then
              msg :=bget(IN.B);
              count := pre(count) +1;
              Modelica.Utilities.Streams.print(String(time)+": "+name+" receives "+String(msg)+" count = "+String(count)+" sizeIN = "+String(bsize(IN.B)));
              if count < maxcount then
                Modelica.Utilities.Streams.print(String(time)+": "+name+" sends "+String(pre(msg))+" count = "+String(count));
                bput(pre(x),OUT.B);
                OUT.tSend := time;
                OUT.snd := not pre(OUT.snd);
              else
                reinit(x,msg);
                count := 0;
                Modelica.Utilities.Streams.print("---- LOOP END IN  "+name+"  ---- count "+String(count));
              end if;
            end if;
          end when;

        equation
          der(x) = derx;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
                coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a simple test case where a buffer is used as storage of messages of Real type.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;IN;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;OUT(nDrivers=maxcount);</p>
<h4>BEHAVIOR</h4>
<p>This model is used to describe all the individual compoments of the <span style=\"font-family: monospace;\">loopModular</span> model. A parameter, named <span style=\"font-family: monospace;\">start</span>, is used to control the periodical generation of messages in the component.</p>
<p>Additionally, the model is configured to forward any input message until the internal counter reaches <span style=\"font-family: monospace;\">maxcount</span>. When this happens, the counter is reset to 0 and the forwarding of messages is interrrupted.</p>
<p>The consecutive message transmissions will use the consecutive drivers of the array included in <span style=\"font-family: monospace;\">OUT</span>.</p>
</html>"));
        end M;

        annotation (Documentation(info="<html>
<p>This package includes the component required to modularly describe the behavior fo the <span style=\"font-family: monospace;\">Loop</span> model, and are used in the <span style=\"font-family: monospace;\">loopModular</span> model. The models included in this package cannot be simulated.</p>
</html>"));
      end LoopModular;

      model noevent "msgs combined with noevent"
        import MSGLib.BufferReal.*;
        Real h( start = 10);
        parameter Real c = 5;
        buffer outh=buffer();
        buffer outdh=buffer();
        Integer s;
        Real dh;

      equation
        dh = der(h);
        der(h)= if noEvent(h>0) then -c*sqrt(h) else 0;

        when h <= 0 then
          bput(pre(h), outh);
          reinit(h,1);
        end when;

        when dh > 0 then
          bput(pre(dh), outdh);
        end when;

      algorithm
        when terminal() then
          s := bsize(outh);
            for i in 1:s loop
              Modelica.Utilities.Streams.print("h = " + String(bget(outh)));
            end for;
          s := bsize(outdh);
            for i in 1:s loop
              Modelica.Utilities.Streams.print("dh = " + String(bget(outdh)));
            end for;
        end when;

         annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=2),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model combines the insertion of messages in the buffers with the use of the noEvent operator.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model includes a continous-time dynamic described using the following equaitions:</p>
<p><span style=\"font-family: monospace;\">dh&nbsp;=<span style=\"color: #ff0000;\">&nbsp;der</span>(h);</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">der</span>(h)=&nbsp;<span style=\"font-family: monospace; color: #0000ff;\">if&nbsp;</span><span style=\"color: #ff0000;\">noEvent</span>(h&gt;0)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;then&nbsp;</span>-c*<span style=\"font-family: monospace; color: #ff0000;\">sqrt</span>(h)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;else&nbsp;</span>0;</p>
<p><br>The discrete-event behavior is trigerred by two state events:</p>
<ul>
<li><span style=\"font-family: monospace;\">h&nbsp;&lt;=&nbsp;0,</span> that generates the insertion of the value pre(<span style=\"font-family: monospace;\">h)</span> as a message in <span style=\"font-family: monospace;\">outh</span>, and the reinit of <span style=\"font-family: monospace;\">h</span> to 1.</li>
<li><span style=\"font-family: monospace;\">dh &gt; 0, </span>that generates the insertion of the value <span style=\"font-family: monospace;\">pre(dh)</span> as a message in <span style=\"font-family: monospace;\">outdh.</span></li>
</ul>
<p><br>Thus, <span style=\"font-family: monospace;\">h</span> and <span style=\"font-family: monospace;\">dh</span> apparently reach 0 simultaneously, but since <span style=\"font-family: monospace;\">noEvent</span> is used to define the value of <span style=\"font-family: monospace;\">dh</span> the second event (<span style=\"font-family: monospace;\">dh &gt; 0</span>) is never triggered.</p>
</html>"));
      end noevent;

      model simultEqBuff "msgs combined with simultaneous events within an equation section"
          import MSGLib.BufferReal.*;
        Real x1(start = 0),x2(start = 10),y;
        buffer out1=buffer();
        buffer out2=buffer();
        Integer s;
      equation

        x1 + x2 = y;
        der(x1) = 1;
        der(x2) = -1;

        when x1 >= 0.5*y then
          reinit(x1,0);
          bput(pre(x1), out1);
          bput(x1, out1);
        end when;

        when x2 >= 0.5*y then
          bput(pre(x2), out2);
          bput(pre(x2), out2);
          reinit(x2,10);
        end when;

      algorithm
        when terminal() then
          s := bsize(out1);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("x1 = " + String(bget(out1)));
          end for;
          s := bsize(out2);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("x2 = " + String(bget(out2)));
          end for;
        end when;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=16),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model combines the occurrence of simultaneous events in the model with the insertion of messages in the buffers, within an equation section.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model includes continuous-time behavior described using the following equations:<span style=\"font-family: monospace;\">&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: monospace;\">x1&nbsp;+&nbsp;x2&nbsp;=&nbsp;y;</span></p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">der</span>(x1)&nbsp;=&nbsp;1;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">der</span>(x2)&nbsp;=&nbsp;-1;</p>
<p>The discrete-event behavior is described using the following conditions for when statements within an equation section:</p>
<ul>
<li><span style=\"font-family: monospace;\">x1&nbsp;&gt;=&nbsp;0.5*y</span></li>
<li><span style=\"font-family: monospace;\">x2&nbsp;&gt;=&nbsp;0.5*y</span></li>
</ul>
<p>These events are simultaneously triggered. The management of each event includes the insertion of a message, containing the <span style=\"font-family: monospace;\">pre()</span> value of the corresponding <span style=\"font-family: monospace;\">x</span> variable, and the <span style=\"font-family: monospace;\">reinit</span> of that variable. The <span style=\"font-family: monospace;\">reinit</span> is performed at the end of the event iteration, so the values stored in the buffers are always the same.</p>
</html>"));
      end simultEqBuff;

      model simultAlgBuff "msgs combined with simultaneous events within an algorithm section"
            import MSGLib.BufferReal.*;
        Real x1(start = 0),x2(start = 10),y;
        buffer out1=buffer();
        buffer out2=buffer();
        Integer s;
      equation
        x1 + x2 = y;
        der(x1) = 1;
        der(x2) = -1;

      algorithm
        when x1 >= 0.5*y then
          reinit(x1,0);
          bput(pre(x1), out1);
          bput(x1, out1);
        end when;

        when x2 >= 0.5*y then
          bput(pre(x2), out2);
          bput(x2, out2);
          reinit(x2,10);
        end when;

      algorithm
        when terminal() then
          s := bsize(out1);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("x1 = " + String(bget(out1)));
          end for;
          s := bsize(out2);
          for i in 1:s loop
            Modelica.Utilities.Streams.print("x2 = " + String(bget(out2)));
          end for;
        end when;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=16),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model combines the occurrence of simultaneous events in the model with the insertion of messages in the buffers, within an algorithm section.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model includes continuous-time behavior described using the following equations: </p>
<p>x1 + x2 = y;</p>
<p>der(x1) = 1;</p>
<p>der(x2) = -1;</p>
<p>The discrete-event behavior is described using the following conditions for when statements within an algorithm section:</p>
<ul>
<li>x1 &gt;= 0.5*y</li>
<li>x2 &gt;= 0.5*y</li>
</ul>
<p>These events are simultaneously triggered. The management of each event includes the insertion of messages, containing the pre() and current value of the corresponding x variable, and the reinit of that variable. Note that since the order of the reinit is different in each when statement, the values stored in each buffer are different.</p>
</html>"));
      end simultAlgBuff;

      model simultCommEq "MPC combined with simultaneous events within an equation section"
        import MSGLib.BufferReal.*;
        Real x1(start = 0),x2(start = 10),y;
        OutPort bx1out;
        InPort bx1in;
        OutPort bx2out;
        InPort bx2in;
      initial algorithm
        couple(bx1out.B,bx1in.B);
        couple(bx2out.B,bx2in.B);
      equation
        bx1out.M = bx1in.M;
        bx2out.M = bx2in.M;

        x1 + x2 = y;
        der(x1) = 1;
        der(x2) = -1;

        when x1 >= 0.5*y then
          bput(0,bx1out.B);
          bx1out.tSend = time;
          bx1out.snd = not pre(bx1out.snd);
        end when;
        when bx1in.rcv then
          reinit(x1, bget(bx1in.B));
        end when;

        when x2 >= 0.5*y then
          bput(10,bx2out.B);
          bx2out.tSend = time;
          bx2out.snd = not pre(bx2out.snd);
        end when;
        when bx2in.rcv then
          reinit(x2, bget(bx2in.B));
        end when;

        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false)),
          experiment(StopTime=16),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model combines the occurrence of simultaneous events in the model with the transmission of messages between ports. </p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;bx1out;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;bx1in;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;bx2out;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;bx2in;</p>
<h4>BEHAVIOR</h4>
<p>This model includes connections between <span style=\"font-family: monospace;\">bxNout</span> ports to <span style=\"font-family: monospace;\">bxNin</span> ports. </p>
<p>The behavior of this model is analogous to <span style=\"font-family: monospace;\">smultEqBuff</span>, but in this case messages are transmitted between ports instead of stored in the buffers. When received at the input port, the transmitted values are used to reinit the x1 and x2 variables, respectively. The behavior of the model is correct due to the instantaneous transmission of the messages.</p>
</html>"));
      end simultCommEq;

      package Bus_DEVS

        model TestSndRcv
          import MSGLib.BufferReal.*;
          parameter Integer numNodes = 2;
          Components.SndRcv node1(name="N1", id = 1, startTime = 1,n=maxout);
          Components.SndRcv node2(name="N2", id = 2,n=maxout);
          parameter Integer maxout = 6;

        initial algorithm
            couple(node1.OUT.B,node2.IN.B);
            couple(node2.OUT.B,node1.IN.B);
        equation
            node1.OUT.M=node2.IN.M;
            node2.OUT.M=node1.IN.M;

          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
                coordinateSystem(preserveAspectRatio=false)),
            experiment(StopTime=3.5),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a simple test case for the SndRcv model, the represents a communication node.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model includes two <span style=\"font-family: monospace;\">Components.SndRcv</span> models that represent two communication nodes, whose interfaces are directly interconnected. The behavior is similar to the <span style=\"font-family: monospace;\">Testing.Loop</span> model. The first node periodically starts communication loops, sending a message to the other node. When the message is received, the node increases its current <span style=\"font-family: monospace;\">mode</span> and forwards the message to the other node if the <span style=\"font-family: monospace;\">mode</span> has not reached a maximum (<span style=\"font-family: monospace;\">n</span>). Otherwise, the communication is interrupted.</p>
</html>"));
        end TestSndRcv;

        model TestSndRcvConfluent
          import MSGLib.BufferReal.*;
          parameter Integer numNodes = 2;
          Components.SndRcv node1(name="N1", id = 1, startTime = 1,n=maxout);
          Components.SndRcv node2(name="N2", id = 2, startTime = 1,n=maxout);
          parameter Integer maxout = 7;

        initial algorithm
            couple(node1.OUT.B,node2.IN.B);
            couple(node2.OUT.B,node1.IN.B);
        equation
            node1.OUT.M=node2.IN.M;
            node2.OUT.M=node1.IN.M;

          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
                coordinateSystem(preserveAspectRatio=false)),
            experiment(StopTime=3.5),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is another simple test case for the <span style=\"font-family: monospace;\">SndRcv</span> model, the represents a communication node.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model is analogous to TestSndRcv, but in this case both nodes start simultaneous communication loops. This behavior forces the execution of confluent transitions in both nodes.</p>
</html>"));
        end TestSndRcvConfluent;

        model TestBus
          import MSGLib.BufferReal.*;
          parameter Integer numNodes = 2;
          Components.SndRcv node1(name="N1", id = 1, startTime = 1);
          Components.SndRcv node2(name="N2", id = 2);
          Components.Bus bus(nNodes=numNodes);

        initial algorithm
            couple(node1.OUT.B,bus.IN[1].B);
            couple(bus.OUT[1].B,node1.IN.B);
            couple(node2.OUT.B,bus.IN[2].B);
            couple(bus.OUT[2].B,node2.IN.B);

        equation
            node1.OUT.M = bus.IN[1].M;
            bus.OUT[1].M = node1.IN.M;
            node2.OUT.M = bus.IN[2].M;
            bus.OUT[2].M = node2.IN.M;

          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
                coordinateSystem(preserveAspectRatio=false)),
            experiment(StopTime=3.5),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a simple test case for a system of two <span style=\"font-family: monospace;\">SndRcv</span> nodes connected using a <span style=\"font-family: monospace;\">Bus</span>.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model is composed of two <span style=\"font-family: monospace;\">Components.SndRcv</span> nodes, connected across a <span style=\"font-family: monospace;\">Components.bus</span> model. The behavior is similar to the TestSndRcv model. A node starts the transmission of a message to the bus. The other node will receive the message, increasing its current mode, and forwarding the message if the mode has not reached a maximum value. Otherwise, the communication is interrupted.</p>
</html>"));
        end TestBus;

        package Components
          model SndRcv
            import MSGLib.BufferReal.*;
            parameter Integer n = 6;
            InPort IN;
            OutPort OUT(nDrivers = n);
            parameter String name = "SndRcv";
            parameter Integer id = 1;
            parameter Real Ptime = 1;
            parameter Real startTime = Modelica.Constants.inf;
            Integer mode( start = 1);
            Integer nrecv;

            discrete Real tNextInt(start=startTime,fixed=true);
            Boolean P,IMM,CONT(start=false),INTT(start=false),EXTT(start=false);
            Boolean intE = time >= pre(tNextInt);
            Boolean extE = IN.rcv;
          initial equation
            pre(P) = time < pre(tNextInt);
            pre(IMM) = time >= pre(tNextInt);
          equation
             P =  (pre(CONT) and not intE) or (pre(INTT) and not intE) or (pre(EXTT) and not intE) or (pre(P) and not
                                                                                                                     (intE or extE));
             IMM = (pre(P) and intE) or (pre(EXTT) and intE) or (pre(CONT) and intE) or (pre(INTT) and intE);
             CONT= pre(IMM) and extE;
             INTT= pre(IMM) and not
                                   (extE);
             EXTT= pre(P) and extE;

            when IMM then
              Modelica.Utilities.Streams.print(String(time)+": "+name+" OUTPUT: premode = "+String(pre(mode)));
              bput(id,OUT.B);
              OUT.tSend =  time;
              OUT.snd =  not pre(OUT.snd);
            end when;

          algorithm
            when CONT then
              Modelica.Utilities.Streams.print(String(time)+": "+name+" CONFLUENT TRANSITION");
              mode := pre(mode)+1;
              if mode < n then
                tNextInt := Modelica.Constants.inf;
              else
                tNextInt := time + 1;
              end if;
              nrecv := bsize(IN.B);
              for i in 1:nrecv loop
                BufferReal.bget(IN.B);
                if mode < n then
                  tNextInt := time;
                else
                  tNextInt :=time + 1;
                end if;
              end for;
            end when;

            when INTT then
              Modelica.Utilities.Streams.print(String(time)+": "+name+" INTERNAL TRANSITION");
              mode := pre(mode)+1;
              if mode < n then
                Modelica.Utilities.Streams.print(String(time)+": "+name+" INTERNAL1: mode ="+String(mode));
                tNextInt := Modelica.Constants.inf;
              else
                tNextInt := time + 1;
              end if;
            end when;

            when EXTT then
              Modelica.Utilities.Streams.print(String(time)+": "+name+" EXTERNAL TRANSITION "+String(bsize(IN.B))+" mode ="+String(mode));
              nrecv := bsize(IN.B);
              for i in 1:nrecv loop
                BufferReal.bget(IN.B);
                if mode < n then
                  tNextInt := time;
                else
                  tNextInt := time +1;
                end if;
              end for;
            end when;

            annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
                  coordinateSystem(preserveAspectRatio=false)),
              Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model represents a communication node used to send and receive messages.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;IN;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;OUT(nDrivers&nbsp;=&nbsp;n);</p>
<h4>BEHAVIOR</h4>
<p>The behavior of this model is described using the Parallel DEVS (PDEVS) formalism. The semantics of PDEVS are implemented as an state automata using the following equations:</p>
<p><br><span style=\"font-family: monospace; color: #0000ff;\">&nbsp;&nbsp;discrete&nbsp;</span></span><span style=\"color: #ff0000;\">Real&nbsp;tNextInt(start=startTime,fixed=true);</p>
<p><span style=\"font-family: monospace; color: #ff0000;\">&nbsp;&nbsp;Boolean</span>&nbsp;P,IMM,CONT(start=false),INTT(start=false),EXTT(start=false);</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">Boolean</span>&nbsp;intE&nbsp;=&nbsp;time&nbsp;&gt;=<span style=\"font-family: monospace; color: #ff0000;\">&nbsp;pre</span>(tNextInt);</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">Boolean</span>&nbsp;extE&nbsp;=&nbsp;IN.rcv;</p>
<p><span style=\"font-family: monospace; color: #0000ff;\">initial&nbsp;equation&nbsp;</span></p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">pre</span>(P)&nbsp;=&nbsp;time&nbsp;&lt;<span style=\"font-family: monospace; color: #ff0000;\">&nbsp;pre</span>(tNextInt);</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">pre</span>(IMM)&nbsp;=&nbsp;time&nbsp;&gt;=<span style=\"font-family: monospace; color: #ff0000;\">&nbsp;pre</span>(tNextInt);</p>
<p><span style=\"font-family: monospace; color: #0000ff;\">equation&nbsp;</span></p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;&nbsp;P&nbsp;=&nbsp;&nbsp;(<span style=\"color: #ff0000;\">pre</span>(CONT)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;not&nbsp;</span>intE)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;or&nbsp;</span>(<span style=\"font-family: monospace; color: #ff0000;\">pre</span>(INTT)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;not&nbsp;</span>intE)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;or&nbsp;</span>(<span style=\"font-family: monospace; color: #ff0000;\">pre</span>(EXTT)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;not&nbsp;</span>intE)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;or&nbsp;</span>(<span style=\"font-family: monospace; color: #ff0000;\">pre</span>(P)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;not</span>(intE<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;or&nbsp;</span>extE));</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;&nbsp;IMM&nbsp;=&nbsp;(<span style=\"color: #ff0000;\">pre</span>(P)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;</span>intE)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;or&nbsp;</span>(<span style=\"font-family: monospace; color: #ff0000;\">pre</span>(EXTT)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;</span>intE)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;or&nbsp;</span>(<span style=\"font-family: monospace; color: #ff0000;\">pre</span>(CONT)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;</span>intE)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;or&nbsp;</span>(<span style=\"font-family: monospace; color: #ff0000;\">pre</span>(INTT)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;</span>intE);</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;&nbsp;CONT=<span style=\"color: #ff0000;\">&nbsp;pre</span>(IMM)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;</span>extE;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;&nbsp;INTT=<span style=\"color: #ff0000;\">&nbsp;pre</span>(IMM)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;not</span>(extE);</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;&nbsp;EXTT=<span style=\"color: #ff0000;\">&nbsp;pre</span>(P)<span style=\"font-family: monospace; color: #0000ff;\">&nbsp;and&nbsp;</span>extE;</p>
<p>where P is a passive state, IMM is the state for imminent internal transition, CONT corresponds to the confluent transition, INTT corresponds to the internal transition and EXTT corresponds to the external transition. Outputs are generated in the IMM state. tNextInt corresponds to the time for the next internal transition.</p>
<p>The model periodically generates output messages, every 1 second. When a message is received the <span style=\"font-family: monospace;\">mode</span> variable is increased and the message is forwarded without delay if the value of mode has not reached the maximum <span style=\"font-family: monospace;\">n. </span>If the maximum is reached, the transmission of messages is interupted.</p>
</html>"));
          end SndRcv;

          model Bus
            import MSGLib.BufferReal.*;
            parameter Integer nNodes = 2;
            parameter Integer numIN = nNodes;
            parameter Integer numOUT = nNodes;
            InPort IN[numIN];
            OutPort OUT[numOUT];
            Real msg;
          algorithm
            for i in 1:numIN loop
              when IN[i].rcv then
                 msg :=BufferReal.bget(IN[i].B);
                  for j in 1:numOUT loop
                    if i <> j then
                      bput(msg,OUT[j].B);
                      OUT[j].tSend := time;
                      OUT[j].snd := not OUT[j].snd;
                    end if;
                  end for;
              end when;
            end for;
            annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
                  coordinateSystem(preserveAspectRatio=false)),
              Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model respresents a communication bus, that can be used to describe a bi-directional communication between N nodes in a computer network.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;IN[numIN];</p><p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;OUT[numOUT];</p>
<h4>BEHAVIOR</h4>
<p>The messages received in the input ports of the model are fowarded to the output ports whose index is different from that of the input port where the message was received.</p>
</html>"));
          end Bus;

          annotation (Documentation(info="<html>
<p>This pacakge includes the internal components used in the TestSndRcv, TestSndRcvConfluent and TestBus models. The included models are not simulable by themselves.</p>
</html>"));
        end Components;
        annotation (Documentation(info="<html>
<p>This package includes models that describe the components of a communication bus, that are described following the DEVS formalism.</p>
</html>"));
      end Bus_DEVS;
      annotation (Documentation(info="<html>
<p>This package includes multiple examples to test the functionality of the library and the message passing communication.</p>
</html>"));
    end Testing;

    package BarrelFilling

      model SourceDestination11
        import MSGLib.BufferReal.*;
        Components.Source Source
          annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
        Components.Destination Destination
          annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
      initial algorithm
        couple(Source.OUT.B, Destination.IN.B);
      equation
        Source.OUT.M = Destination.IN.M;

        annotation (
          Line(points = {{-60, 50}, {-38, 50}}, color = {0, 0, 0}),
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime = 30),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a test case for a direct communication between one Source and one Destination.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>The periodical transmissions from the Source model are instantaneously received by the Destination.</p>
</html>"));
      end SourceDestination11;

      model SourceDestinationN1
          import MSGLib.BufferReal.*;

        Components.Source Source1(value=0.1, name="s1")
          annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
        Components.Source Source2(value=0.2, name="s2")
          annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
        Components.Destination Destination
          annotation (Placement(transformation(extent={{-20,20},{0,40}})));

      initial algorithm
        couple(Source1.OUT.B, Destination.IN.B);
        couple(Source2.OUT.B, Destination.IN.B);
      equation
        Source1.OUT.M + Source2.OUT.M = Destination.IN.M;

        annotation (
          Line(points = {{-60, 50}, {-38, 50}}, color = {0, 0, 0}),
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime = 30),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a test case for a direct communication between N <span style=\"font-family: monospace;\">Source</span> and one <span style=\"font-family: monospace;\">Destination</span>.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>Two <span style=\"font-family: monospace;\">Source</span> models are connected to the same port of the <span style=\"font-family: monospace;\">Destination</span> model. Note that the M variables of the output ports of the Source models are summed and the sum assigned to the M variable of the input port.</p>
<p>Both <span style=\"font-family: monospace;\">Source</span> models perform simultaneous transmissions, that are compiled as a bag of messages in the input port of the <span style=\"font-family: monospace;\">Destination</span> and can be received at once.</p>
</html>"));
      end SourceDestinationN1;

      model SourceDestination1N
        import MSGLib.BufferReal.*;
        Components.Source Source
          annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
        Components.Destination Destination1(name="dest1")
          annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
        Components.Destination Destination2(name="dest2")
          annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
      initial algorithm
        couple(Source.OUT.B, Destination1.IN.B);
        couple(Source.OUT.B, Destination2.IN.B);
      equation
        Source.OUT.M = Destination1.IN.M;
        Source.OUT.M = Destination2.IN.M;
        annotation (
          Line(points = {{-60, 50}, {-38, 50}}, color = {0, 0, 0}),
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime=30),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a test case for a direct communication between one <span style=\"font-family: monospace;\">Source</span> and N <span style=\"font-family: monospace;\">Destination</span>.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>One <span style=\"font-family: monospace;\">Source</span> model is connected at the same time to the input ports of two <span style=\"font-family: monospace;\">Destination</span> models. The periodically transmitted messages from the Source model are simultaneously copied to both destinations, and received simultaneously.</p>
</html>"));
      end SourceDestination1N;

      model SourceDestinationNM
        import MSGLib.BufferReal.*;
        Components.Source Source2(value=2)
          annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
        Components.Destination Destination1(name="dest1")
          annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
        Components.Destination Destination2(name="dest2")
          annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
        Components.Source Source1(value=1)
          annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
      initial algorithm
        couple(Source1.OUT.B, Destination1.IN.B);
        couple(Source2.OUT.B, Destination1.IN.B);
        couple(Source2.OUT.B, Destination2.IN.B);
      equation
        Source1.OUT.M + Source2.OUT.M = Destination1.IN.M;
        Source2.OUT.M = Destination2.IN.M;

        annotation (
          Line(points = {{-60, 50}, {-38, 50}}, color = {0, 0, 0}),
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime=30),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a test case for a direct communication between N Source and N Destination.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>The model includes two <span style=\"font-family: monospace;\">Source</span> models and two <span style=\"font-family: monospace;\">Destination</span> models.</p>
<p>The first <span style=\"font-family: monospace;\">Source</span> is only connected to the first <span style=\"font-family: monospace;\">Destination</span>, while the second <span style=\"font-family: monospace;\">Source</span> is connected to both <span style=\"font-family: monospace;\">Destination</span> models. Note the equations between the M variables of the ports used to describe these connections.</p>
<p>All the messages generated by both sources arrive simultaneously to both destinations. Barrels from the second source are duplicated and sent to both destinations. The first destination simultaneosuly receives the barrels from both sources.</p>
</html>"));
      end SourceDestinationNM;

      model FillerModel
        import MSGLib.BufferReal.*;
        Components.Source arrivals( value=0.1)
          annotation (Placement(transformation(extent={{-82,0},{-62,20}})));
        Components.Destination departure
          annotation (Placement(transformation(extent={{20,0},{40,20}})));
        Components.Filler filler annotation (
          Placement(transformation(extent = {{-32, 0}, {-12, 20}})));
      initial algorithm
        couple(arrivals.OUT.B, filler.IN.B);
        couple(filler.OUT.B, departure.IN.B);
      equation
        arrivals.OUT.M = filler.IN.M;
        filler.OUT.M = departure.IN.M;
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime = 50),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is a test case for the complete filling system, including a <span style=\"font-family: monospace;\">Source</span>, a <span style=\"font-family: monospace;\">Filler</span> and a <span style=\"font-family: monospace;\">Destination</span> components.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>The <span style=\"font-family: monospace;\">Source</span> is connected to the <span style=\"font-family: monospace;\">Filler</span>, and this to the <span style=\"font-family: monospace;\">Destination</span>. </p>
<p>Barrels generated by the <span style=\"font-family: monospace;\">Source</span> arrive to the <span style=\"font-family: monospace;\">Filler</span>, that performs the filling process and when full are finally sent to the <span style=\"font-family: monospace;\">Destination</span>.</p>
<p>The Filler includes a queue of barrels that wait to be filled while another barrel is being processed (cf. <span style=\"font-family: monospace;\">numpending</span> variable of the <span style=\"font-family: monospace;\">Filler</span> model).</p>
</html>"));
      end FillerModel;

      model FillerModelZEIG
        import MSGLib.BufferReal.*;
        Components.Destination destination
          annotation (Placement(transformation(extent={{0,0},{20,20}})));
        Components.FillerZEIG filler
          annotation (Placement(transformation(extent={{-32,0},{-12,20}})));
        Components.MsgOnOff msgonoff
          annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
        Modelica.Blocks.Sources.Sine inflow(
          amplitude=0.5,
          f=0.05,
          offset=1) annotation (Placement(transformation(extent={{-90,-32},{-70,
                  -12}})));
      initial algorithm
        couple(msgonoff.OUT.B, filler.onoff.B);
        couple(filler.barrel.B, destination.IN.B);
      equation
        msgonoff.OUT.M = filler.onoff.M;
        filler.barrel.M = destination.IN.M;
        connect(inflow.y, filler.inflow) annotation (Line(points={{-69,-22},{
                -50,-22},{-50,5.4},{-31.4,5.4}}, color={0,0,127}));
        annotation (
          Icon(coordinateSystem(preserveAspectRatio = false)),
          Diagram(coordinateSystem(preserveAspectRatio = false)),
          experiment(StopTime = 50),
          Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model implements the complete system including the Filler as described in &quot;Theory of Modeling and Simulation: Discrete Event &amp; Iterative System Computational Foundations&quot; by Bernard P. Zeigler, Alexandre Muzy and Ernesto Kofman.</p>
<h4>MPC INTERFACE</h4>
<p>This model does not have any interface port</p>
<h4>BEHAVIOR</h4>
<p>This model implements the complete system including the filler (<span style=\"font-family: monospace;\">Components.FillerZEIG</span> model) described by Zeigler et al. (cf. pag 229).</p>
<p>The FillerZEIG model receives a discrete input from the <span style=\"font-family: monospace;\">Components.MsgOnOff </span>model, that are used to set the filling process on and off.</p>
<p>The FillerZEIG also receives a continuous flow input that is described using a Sine block from the Modelica Standard Library. This input is used as the filling rate for the process.</p>
<p>Full barrels are sent as outputs to the <span style=\"font-family: monospace;\">Destination</span> model. </p>
<p>This model serves as an example of the use of MSGLib in combination with other Modelica functionality to describe DEV&amp;DESS models.</p>
</html>"));
      end FillerModelZEIG;

      package Components
        model Source
          import MSGLib.BufferReal.*;
          parameter Real interArrival = 5;
          parameter Integer numOut = 1;
          parameter Real value = 0.1;
          Integer numarrived(start = 0);
          Real newbarrel(start=value);
          parameter String name = "source";
          OutPort OUT;
        algorithm
          // initial generation of barrels
          when sample(0, interArrival) then
            if value == 0 then  // used to identify msgs received in examples
              newbarrel := value;
            else
              newbarrel := pre(newbarrel)+1;
            end if;
            Modelica.Utilities.Streams.print(String(time) + ":" + name + "PUT (" + String(time) + "):" + String(pre(newbarrel)));
            bput(pre(newbarrel),OUT.B);
            OUT.tSend := time;
            OUT.snd := not pre(OUT.snd);
            numarrived := pre(numarrived) + 1;
          end when;

          annotation (
            Placement(transformation(extent = {{80, -10}, {100, 10}})),
            Icon(coordinateSystem(preserveAspectRatio = false)),
            Diagram(coordinateSystem(preserveAspectRatio = false)),
            experiment(StopTime = 100),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is used to represent the source of barrels in the facility. </p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;OUT;</p>
<h4>BEHAVIOR</h4>
<p>Barrels are described as messages that can be sent between the different compoments of the system (e.g., source, filler and destination).</p>
<p>This model periodically generates barrels, with an interval defined with the <span style=\"font-family: monospace;\">interArrival </span>parameter<span style=\"font-family: monospace;\">. </span></p>
</html>"));
        end Source;

        model Destination
          import MSGLib.BufferReal.*;
          parameter String name = "destination";
          Integer count;
          Real barrel(start=-1);
          InPort IN;
          Integer size;
        algorithm
          // receive barrels
          when IN.rcv then
            size := bsize(IN.B);
            for i in 1:size loop
              barrel := bget(IN.B);
              Modelica.Utilities.Streams.print(String(time)+": DESTINATION "+name+" MSG RCV "+String(barrel));
              count := count + 1;
            end for;
          end when;

          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false)),
            Diagram(coordinateSystem(preserveAspectRatio = false)),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is used as end point for the barrels in the system. </p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;IN;</p>
<h4>BEHAVIOR</h4>
<p>The model stays in a passive state until a barrel is received. Received barrels are counted and removed from the system, before returning to the passive state.</p>
</html>"));
        end Destination;

        model Filler
          import MSGLib.BufferReal.*;
          parameter String name = "filler";
          parameter Real fillingRate = 1;
          parameter Real maxContent = 10;

          Real filling(start = 0, fixed = true);
          Real aux( start=1);
          Boolean active(start = false);
          Integer arrived;
          Integer numpending(start = 0);
          InPort IN;
          OutPort OUT;
          buffer pending= buffer(); // internal buffer for pending barrels
          Boolean barrelfull;
        equation
          // filling rate
          der(filling) = if active then fillingRate else 0;

        algorithm
          // reception of new barrels
          when IN.rcv then
            arrived := bsize(IN.B);
            Modelica.Utilities.Streams.print("Time:" + String(time) + ", ARRIVED " + String(bsize(IN.B)) + " at " + name);
            for i in 1:arrived loop
              aux := bget(IN.B); // extract new barrel
              if not active then  // idle, start filling new barrel
                reinit(filling, aux);
                active := true;
                Modelica.Utilities.Streams.print(name + " not active(" + String(active) + "), reinit to " +String(aux));
              else // active, insert new barrel into pending buffer
                Modelica.Utilities.Streams.print(name + " active, insert in pending");
                numpending := numpending + 1;
                bput(aux, pending);
              end if;
            end for;
          end when;

          // barrel full
          when filling >= maxContent then
            Modelica.Utilities.Streams.print("Time:" + String(time) + "BARREL FULL " + String(active));
            if active then
              barrelfull := not barrelfull;
              active := false;
              if bsize(pending) > 0 then
                aux := bget(pending);
                reinit(filling, aux);
                active := true;
                numpending := numpending - 1;
              else
                reinit(filling,0);
              end if;
            end if;
          end when;

        algorithm
          when change(barrelfull) then
            // send full barrel
            bput(pre(aux),OUT.B);
            OUT.tSend := time;
            OUT.snd := not pre(OUT.snd);
          end when;
          annotation (
            Icon(coordinateSystem(preserveAspectRatio = false)),
            Diagram(coordinateSystem(preserveAspectRatio = false)),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is used to represent the source of barrels in the facility. </p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;IN;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;OUT;</p>
<h4>BEHAVIOR</h4>
<p>This model represents the compoment where barrels are filled. </p>
<p>Received barrels are either filled, if the component is idle, or stored into a queue of pending barrels (described using a buffer named <span style=\"font-family: monospace;\">pending</span>), where the barrels wait for their turn.</p>
<p>Once a barrel is full, it is sent as an output barrel and, if the pending queue is not empty, a new barrel is filled. Otherwise, the process remains idle waiting for the reception of new barrels.</p>
</html>"));
        end Filler;

        model FillerZEIG
          import MSGLib.BufferReal.*;
          // Xcont
          Modelica.Blocks.Interfaces.RealInput inflow
            annotation (Placement(transformation(extent={{-114,-66},{-74,-26}})));
          // Ycont
          Modelica.Blocks.Interfaces.RealOutput cout
            annotation (Placement(transformation(extent={{80,-54},{100,-34}})));
          // Xdiscr
          InPort onoff;
          Integer msg;
          // Ydiscr
          OutPort barrel;  // barrel output
          // Scont
          Real contents(start = 0, fixed = true);
          // Sdiscr
          Boolean valveopen( start = false);
          Boolean barrelfull;

        algorithm
            // event condition
          when contents >= 10 then
            barrelfull := not barrelfull;
          end when;

        algorithm
          when change(barrelfull) then
            // discr output
            bput(pre(contents),barrel.B);
            barrel.tSend := time;
            barrel.snd := not pre(barrel.snd);
          end when;

          // external transition
        algorithm
          when onoff.rcv then
            msg :=integer(BufferReal.bget(onoff.B));
            if msg == 1 then
              valveopen := true; // open
            else
              valveopen := false; // closed
            end if;
          end when;

        equation
              // internal transition
          when change(barrelfull) then
            reinit(contents,0);
          end when;

          // cont output
          cout = contents;
          // f
          der(contents) = if valveopen then inflow else 0;

            annotation (Placement(transformation(extent={{-114,20},{-74,60}})),
            Icon(coordinateSystem(preserveAspectRatio = false)),
            Diagram(coordinateSystem(preserveAspectRatio = false)),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model implements the barrel filler described in &quot;Theory of Modeling and Simulation: Discrete Event &amp; Iterative System Computational Foundations&quot; by Bernard P. Zeigler, Alexandre Muzy and Ernesto Kofman.</p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">InPort</span>&nbsp;onoff;</p>
<p><span style=\"font-family: monospace;\">&nbsp;&nbsp;<span style=\"color: #ff0000;\">OutPort</span>&nbsp;barrel;</p>
<h4>BEHAVIOR</h4>
<p>This model has been described following the DEV&amp;DESS specification found in Zeigler et al.</p>
<p>The filling process behaves as follwos. The messages received at the <span style=\"font-family: monospace;\">onoff</span> port define if the input valve is open or closed. When closed the process is stopped. When open the model fill barrels at the rate defined by the <span style=\"font-family: monospace;\">inflow</span> input. </p>
<p>The <span style=\"font-family: monospace;\">cout</span> continuous output correspond to the content of the current barrel and can be used to observe the evolution of the process. When the current barrel is full it is sent through the barrel port and a new barrel is started. </p>
</html>"));
        end FillerZEIG;

        model MsgOnOff
          import MSGLib.BufferReal.*;
          parameter Real[8] timeOutputs = {1,10,11,16,20,28,29,35};
          Integer indexOutputs( start=1);
          Integer outSignal( start = 1);
          parameter String name = "OfOffsignal";
          OutPort OUT annotation (Placement(
                transformation(extent={{80,-12},{100,8}}), iconTransformation(
                  extent={{90,-10},{110,10}})));
        algorithm
          // initial generation of barrels
          when time >= timeOutputs[indexOutputs] then
            if indexOutputs < 8 then
              indexOutputs := indexOutputs+1;
            end if;
            bput(pre(outSignal),OUT.B);
            OUT.tSend := time;
            OUT.snd := not pre(OUT.snd);
            outSignal := 1 - outSignal;
          end when;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
                coordinateSystem(preserveAspectRatio=false)),
            Documentation(info="<html>
<h4>DESCRIPTION</h4>
<p>This model is used to control the state of the input valve of the FillerZEIG model. </p>
<h4>MPC INTERFACE</h4>
<p><span style=\"font-family: monospace; color: #ff0000;\">OutPort</span>&nbsp;OUT;</p>
<h4>BEHAVIOR</h4>
<p>This model represents a source of messages used to set the state of the input valve for the FillerZEIG model. Messages are transmitted at pre-defined points in time.</p>
</html>"));
        end MsgOnOff;
        annotation (Documentation(info="<html>
<p>This pacakge includes the internal components used in the models included in the <span style=\"font-family: monospace;\">BarrelFilling</span> package. The included models are not simulable by themselves.</p>
</html>"));
      end Components;
      annotation (Documentation(info="<html>
<p>This package includes models used to describe a barrel filling facility as an example of hybrid system with a combination of continuous-time and discrete-event dynamics.</p>
</html>"));
    end BarrelFilling;

    annotation (Documentation(info="<html>
<p><span style=\"font-size: 9pt;\">This package includes multiple test cases and illustrative examples.</span></p>
</html>"));
  end Examples;
  annotation (uses(Modelica(version="4.0.0"), DESLib2(version="2")),
      Documentation(info="<html>
<p><b>MSGLib - Message Passing Communication Library</b><br>
Version: 2.0
</p>

<p>
<dl>
<dt><b>Author:</b></dt>
<dd><a href=\"http://www.euclides.dia.uned.es/vsanz\"> Victorino Sanz </a><br>
    Dpto. Inform&aacute;tica y Autom&aacute;tica, UNED<br>
    Juan del Rosal, 16<br>
    28040, Madrid<br>
    Spain<br>
    Email: <A HREF=\"mailto:vsanz@dia.uned.es\">vsanz@dia.uned.es</A><br>
    Website: <A HREF=\"http://www.euclides.dia.uned.es/vsanz\">www.euclides.dia.uned.es/vsanz</A><br>
</dl>
</p>

<p>
<dl>
<dt><b>Copying:</b></dt>
<dd><i>
     Licensed by Victorino Sanz under the LGPL-3.0 or later. <br>
     Copyright 2023, Victorino Sanz.<br>
     This program is free software: you can redistribute it and/or modify it under the terms of the GNU Leaser General Public License as published by the Free Software Foundation, either version 3 of the License, or  any later version.<br>
     This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;  without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Leaser General Public License for more details.<br>
     You should have received a copy of the GNU Leaser General Public License along with this program (LICENSE). If not, see &lt;https://www.gnu.org/licenses/&gt;.<br>
</i>
</dl>
</p>

</html>"));
end MSGLib;

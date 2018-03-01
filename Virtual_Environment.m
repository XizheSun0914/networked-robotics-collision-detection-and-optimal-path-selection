function Virtual_Environment(block)
 
setup(block);
  

function setup(block)

  block.NumInputPorts  = 2; % pos, vel
  block.NumOutputPorts = 1; % force
  
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(2).DatatypeID  = 0;  % double
  block.InputPort(2).Complexity  = 'Real';
  
  block.OutputPort(1).DatatypeID  = 0; % double
  block.OutputPort(1).Complexity  = 'Real';

  %% kWall, bWall, nWall, pWall, dof, tsampling
  block.NumDialogPrms     = 6;
  
  dof = block.DialogPrm(5).Data;
  tsampling = block.DialogPrm(6).Data;
  
  block.InputPort(1).Dimensions = dof;
  block.InputPort(2).Dimensions = dof;
  block.OutputPort(1).Dimensions= dof;
  
  block.InputPort(1).SamplingMode = tsampling;
  block.InputPort(2).SamplingMode = tsampling;
  block.OutputPort(1).SamplingMode= tsampling;

  block.SampleTimes = [tsampling 0];
  
  block.SimStateCompliance = 'DefaultSimState';

  block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);

  block.RegBlockMethod('Start', @Start);

  block.RegBlockMethod('Outputs', @Outputs);

  block.RegBlockMethod('Update', @Update);

  block.RegBlockMethod('Terminate', @Terminate);

    
function DoPostPropSetup(block)
  block.NumDworks = 1;
  
  dof = block.DialogPrm(5).Data;
  
  block.Dwork(1).Name            = 'Fe_1';
  block.Dwork(1).Dimensions      = dof;
  block.Dwork(1).DatatypeID      = 0;      % double
  block.Dwork(1).Complexity      = 'Real'; % real
  block.Dwork(1).UsedAsDiscState = true;
  
  block.AutoRegRuntimePrms;


function Start(block)

  dof = block.DialogPrm(5).Data;

  block.Dwork(1).Data = zeros(dof,1);
   

function Outputs(block)
  
  pos = block.InputPort(1).Data;
  vel = block.InputPort(2).Data;
  
  kWall = block.DialogPrm(1).Data;
  bWall = block.DialogPrm(2).Data;
  nWall = block.DialogPrm(3).Data;
  pWall = block.DialogPrm(4).Data;
  dof = block.DialogPrm(5).Data;
  tsampling = block.DialogPrm(6).Data;
  
  Fe_1 = block.Dwork(1).Data;
  
  if (pos-pWall)'*nWall <= 0
      dpen = abs((pos-pWall)'*nWall/norm(nWall));
      dpen_p = abs(((pos+vel*tsampling)-pWall)'*nWall/norm(nWall));
      Fi = kWall*dpen*nWall;
      if vel'*nWall < 0
          if norm(Fe_1)-norm(Fi)<0
              Fe = (kWall*dpen_p+norm(Fi)-norm(Fe_1))*nWall;
          else
              Fe = (kWall*dpen_p)*nWall;
          end
      else
          if norm(Fe_1)-norm(Fi)>0
              Fe = (kWall*dpen+norm(Fi)-norm(Fe_1))*nWall;
          else
              Fe = (kWall*dpen_p)*nWall;
          end
      end
  else
      Fe = zeros(dof,1);
  end
              
  block.OutputPort(1).Data = Fe;
  

function Update(block)
  
  block.Dwork(1).Data = block.OutputPort(1).Data;
  

function Terminate(block)

disp(['Terminating the block with handle ' num2str(block.BlockHandle) '.']);
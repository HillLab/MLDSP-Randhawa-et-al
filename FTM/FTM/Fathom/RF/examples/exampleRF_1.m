% Example Random Forest 1
% 
% -----Author:-----
% by David L. Jones, Sep-2009
%
% This file is part of the 'FATHOM TOOLBOX FOR MATLAB' and
% is released under the GNU General Public License, version 2.

% File: '.../examples/iris_Y.mat'

% Load Fisher's Iris data:
load iris_R.mat

% Generate Random Forest:
% USAGE: model = f_RFclass(X,Y,nTree,mTry,imp,sim,'stnd',verb,X_txt,opt);
model = f_RFclass(X,Y,[],[],1,0,'raw',1);

% Generating 1000 trees with 2 random subsets of variables
% for 3 classes...
% 
% =======================================================
% =====     INPUT PARAMETERS FOR RANDOM FOREST:     =====
% =======================================================
% nTree          = 1000
% mTry           = 2
% X: # obs = 150, # var's = 4 
% # Y classes    = 3 
% addclass       = 0
% size(ncat)     = 1
% size(ncat)     = 4
% maxcat         = 1
% size(sampsize) = 1
% size(sampsize) = 1
% sampsize[0]    = 150
% stratify       = 0
% imp            = 1
% sim            = 0
% oob_prox       = 0
% strata         = 1
% ipi            = 0
% classwt        = 1.0000
% classwt        = 1.0000
% classwt        = 1.0000
% cutoff         = 0.3333
% cutoff         = 0.3333
% cutoff         = 0.3333
% nodesize       = 1.0000
% =======================================================
% (Using raw data for X) 
% Ave. error rate (after 1000 iterations) = 0.0400
% ==================================================
%        RANDOM FOREST 'Majority Rules' 
%   Internal Cross-validation Classification Success: 
% --------------------------------------------------
% Class        Corrrect  
%    1           100.00 % 
%    2            94.00 % 
%    3            94.00 % 
% 
% 
% Total Correct  = 96.00 % 
% Total Error    = 4.00 % 
% Prior prob     = class size 
% 
% --------------------------------------------------
%      Confusion Matrix (%): 
% class:      1      2      3 
%      1 100.00   0.00   0.00 
%      2   0.00  94.00   6.00 
%      3   0.00   6.00  94.00 
% ==================================================



% Create diagnostic plots:
f_RFplot(model,2,1,1);


% Show variable importance measures, sorted by their z-scores:
f_RFimp(model);
% 
% ==================================================
% =====      Variable Importance Measures:     =====
% ==================================================
% col 1: variable label
% col 2: meanAcc
% col 3: zScore
% col 2: zP
% ---------------------
% 3  30.701   3.596   0.000
% 4  29.818   3.572   0.000
% 1   3.471   1.930   0.027
% 2   0.689   1.050   0.147
% ==================================================


% Re-run, no variable importance, but proximities:
model = f_RFclass(X,Y,[],[],0,1,'raw',1);
% 
% Ave. error rate (after 1000 iterations) = 0.0400
% ==================================================
%        RANDOM FOREST 'Majority Rules' 
%   Internal Cross-validation Classification Success: 
% --------------------------------------------------
% Class        Corrrect  
%    1           100.00 % 
%    2            94.00 % 
%    3            94.00 % 
% 
% 
% Total Correct  = 96.00 % 
% Total Error    = 4.00 % 
% Prior prob     = class size 
% 
% --------------------------------------------------
%      Confusion Matrix (%): 
% class:      1      2      3 
%      1 100.00   0.00   0.00 
%      2   0.00  94.00   6.00 
%      3   0.00   6.00  94.00 
% ==================================================

% Show outlierness measures:
f_outlier(model.prox,Y,1);

% Show that the proximities are similar to those generated by the 'randomForest'
% package for R:
[r,p] = f_mantel(1-prox,1-model.prox,0,1000);
% >> r^2 = 0.9984

% Create a Random Forest Canonical Discriminant Analysis plot:
f_RFvis(model,0.95,0,0.05);


% Unsupervised:
model_U = f_RFclass(X,[],[],[],0,1,'raw',1);
% % 
% Generating 1000 trees with 2 random subsets of variables
% for 2 classes...
% 
% =======================================================
% =====     INPUT PARAMETERS FOR RANDOM FOREST:     =====
% =======================================================
% nTree          = 1000
% mTry           = 2
% X: # obs = 150, # var's = 4 
% # Y classes    = 2 
% addclass       = 1
% size(ncat)     = 1
% size(ncat)     = 4
% maxcat         = 1
% size(sampsize) = 1
% size(sampsize) = 1
% sampsize[0]    = 150
% stratify       = 0
% imp            = 0
% sim            = 1
% oob_prox       = 1
% strata         = 1
% ipi            = 0
% classwt        = 1.0000
% classwt        = 1.0000
% cutoff         = 0.5000
% cutoff         = 0.5000
% nodesize       = 1.0000
% =======================================================
% (Using raw data for X) 

f_RFvis(model_U);

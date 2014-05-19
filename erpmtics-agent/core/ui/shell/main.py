#!/usr/bin/env python
# -*- coding: UTF-8 -*- 

###############################################################################
# Copyright (C) 2014 Armando Ibarra
# v0.1 alpha - 2014-May-19
# 
#

# GOALS
# shell for erpmtics agent

#----------------------------------------------------------------------
# main.py
#
# Created: 19/05/2014
#
# Author: Ing. Armando Ibarra - armandoibarra1@gmail.com
#----------------------------------------------------------------------

# Licensed under the GNU LGPL v2.1 - http://www.gnu.org/licenses/lgpl-2.1.html
# - or any later version.
# @author: Ing. Armando Ibarra

# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
###############################################################################


"""Shell interface for agent erpmtics"""

import cmd
import getpass
import logging

VERSION = '0.0'

INTRO = [
    'Welcome to erpmtics (shell mode).', 
    'Type "help" to get a list of available commands.',
    'Type "help <command>" to get a detailed help about that command'
]

ARGUMENTS = {
    'status': ['online', 'shutdown', 'process'],

}

class Main(cmd.Cmd):
    def __init__(self):
        cmd.Cmd.__init__(self)
        
        self.log = logging.getLogger('erpmtics:CMD')
        self.prompt = 'erpmtics> '
        self.intro = '\n'.join(INTRO)


if __name__=='__main__':
    # Setup the 2 contexts.
    #get_category_links(BASE_URL)
    shell = Main()
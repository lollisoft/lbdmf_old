
/*...sLicence:0:*/
/*
    DMF Distributed Multiplatform Framework (the initial goal of this library)
    This file is part of lbDMF.
    Copyright (C) 2002  Lothar Behrens (lothar.behrens@lollisoft.de)

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


    The author of this work will be reached by e-Mail or paper mail.
    e-Mail: lothar.behrens@lollisoft.de
    p-Mail: Lothar Behrens
            Ginsterweg 4

            65760 Eschborn (germany)
*/
/*...e*/

/** \brief class Applications_Formulars.
 * Documentation for Applications_Formulars
 */
class Applications_FormularsModel : public lb_I_Applications_Formulars {
public:
	Applications_FormularsModel();
	virtual ~Applications_FormularsModel();

	long		LB_STDCALL addApplications_Formulars(long _anwendungid, long _formularid,  long _Applications_FormularsID = -1);

	bool		LB_STDCALL selectApplications_Formulars(long _id);
	int			LB_STDCALL getApplications_FormularsCount();
	bool		LB_STDCALL hasMoreApplications_Formulars();
	void		LB_STDCALL setNextApplications_Formulars();
	void		LB_STDCALL finishApplications_FormularsIteration();


	long		LB_STDCALL get_anwendungid();
	
	long		LB_STDCALL get_formularid();
	

	long		LB_STDCALL get_id();

	bool		LB_STDCALL ismarked();
	void		LB_STDCALL mark();
	void		LB_STDCALL unmark();

	void		LB_STDCALL deleteUnmarked();
	void		LB_STDCALL deleteMarked();

	DECLARE_LB_UNKNOWN()
	DECLARE_EXTENSIBLEOBJECT()

	UAP(lb_I_Container, objectExtensions)
	

	UAP(lb_I_Container, Applications_Formulars)
	

	UAP(lb_I_Long, currentanwendungid)
	
	UAP(lb_I_Long, currentformularid)
	

	
	UAP(lb_I_Long, currentApplications_FormularsID)

	UAP(lb_I_Long, marked)
};

DECLARE_FUNCTOR(instanceOflbApplications_FormularsModel)
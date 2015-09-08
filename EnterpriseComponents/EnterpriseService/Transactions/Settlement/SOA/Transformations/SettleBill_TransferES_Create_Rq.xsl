<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:v1="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Settlement/V1"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl v13 v1 oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:v11="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:es="http://xmlns.equitybank.co.ke/ESB/ES/Transactions/Settlement/V1"
                xmlns:v12="http://xmlns.equitybank.co.ke/ESB/ES/Transactions/Transfer/V1">
    <oracle-xsl-mapper:schema>
        <oracle-xsl-mapper:mapSources>
            <oracle-xsl-mapper:source type="WSDL">
                <oracle-xsl-mapper:schema location="../WSDLs/Settlement.wsdl"/>
                <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Settlement/V1"/>
            </oracle-xsl-mapper:source>
            <oracle-xsl-mapper:source type="WSDL">
                <oracle-xsl-mapper:schema location="../WSDLs/Settlement.wsdl"/>
                <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Settlement/V1"/>
                <oracle-xsl-mapper:param name="recordCounter"/>
            </oracle-xsl-mapper:source>
        </oracle-xsl-mapper:mapSources>
        <oracle-xsl-mapper:mapTargets>
            <oracle-xsl-mapper:target type="WSDL">
                <oracle-xsl-mapper:schema location="../WSDLs/TransferES.wsdl"/>
                <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Transfer/V1"/>
            </oracle-xsl-mapper:target>
        </oracle-xsl-mapper:mapTargets>
    </oracle-xsl-mapper:schema>
    <xsl:param name="recordCounter"/>
    <xsl:template match="/">
        <xsl:variable name="actionCode"
                      select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "ActionCode","","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
        <v1:ESBMsg>
            <v11:MsgID><xsl:value-of select="UUIDUserFunction:uuid ( )"/></v11:MsgID>
            <v11:Source>COR</v11:Source>
            <v11:MsgType>Enterprise</v11:MsgType>
            <v11:Service>TransferES</v11:Service>
            <v1:RqData actionCode='{$actionCode}'>
                <xsl:choose>
                    <xsl:when test="$actionCode = 'AccountEntryPosting'">
                        <v1:Transfer>
                            <v11:Transaction>
                                <v11:AccountIdentifier>
                                    <v11:BankID>
                                        <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "BankID" )'/>
                                    </v11:BankID>
                                    <v11:AccountID>
                                        <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "AccountID" )'/>
                                    </v11:AccountID>
                                    <v11:AccountCurrency>
                                        <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "Currency" )'/>
                                    </v11:AccountCurrency>
                                </v11:AccountIdentifier>
                                <v11:TransactionType>D</v11:TransactionType>
                                <v11:TransactionReferenceNumber>
                                    <xsl:value-of select="/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:RefKey"/>
                                </v11:TransactionReferenceNumber>
                                <xsl:if test='/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID !=""'>
                                    <v11:TransactionDescription>
                                        <xsl:value-of select="concat('EATTA Settlement Run Ref - ',/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:RefKey)"/>
                                    </v11:TransactionDescription>
                                </xsl:if>
                                <xsl:if test='/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID !=""'>
                                    <v11:TransactionAmount currencyCode='{dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "Currency","","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )}'>
                                        <xsl:value-of select="/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v11:Amount"/>
                                    </v11:TransactionAmount>
                                </xsl:if>
                                <v11:Remarks>Settlement Run EATTA</v11:Remarks>
                                <v11:ValueDate>
                                    <xsl:value-of select="xp20:current-date()"/>
                                </v11:ValueDate>
                            </v11:Transaction>
                            <v11:Transaction>
                                <v11:AccountIdentifier>
                                    <xsl:if test='/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID !=""'>
                                        <v11:BankID>
                                            <xsl:value-of select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "BankID" ,"","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
                                        </v11:BankID>
                                    </xsl:if>
                                    <xsl:if test='/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID !=""'>
                                        <v11:AccountID>
                                            <xsl:value-of select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "AccountID" ,"","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
                                        </v11:AccountID>
                                    </xsl:if>
                                    <xsl:if test='/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID !=""'>
                                        <v11:AccountCurrency>
                                            <xsl:value-of select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "Currency" ,"","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
                                        </v11:AccountCurrency>
                                    </xsl:if>
                                </v11:AccountIdentifier>
                                <v11:TransactionType>C</v11:TransactionType>
                                <v11:TransactionReferenceNumber>
                                    <xsl:value-of select="/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:RefKey"/>
                                </v11:TransactionReferenceNumber>
                                <xsl:if test='/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID !=""'>
                                    <v11:TransactionDescription>
                                        <xsl:value-of select="concat('EATTA Settlement Run Ref - ',/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:RefKey)"/>
                                    </v11:TransactionDescription>
                                </xsl:if>
                                <xsl:if test='/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID !=""'>
                                    <v11:TransactionAmount currencyCode='{dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "Currency","","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )}'>
                                        <xsl:value-of select="/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v11:Amount"/>
                                    </v11:TransactionAmount>
                                </xsl:if>
                                <xsl:if test='/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID !=""'>
                                    <v11:Remarks>
                                        <xsl:value-of select="concat('Settlement to ',/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID)"/>
                                    </v11:Remarks>
                                </xsl:if>
                                <v11:ValueDate>
                                    <xsl:value-of select="xp20:current-date()"/>
                                </v11:ValueDate>
                            </v11:Transaction>
                        </v1:Transfer>
                    </xsl:when>
                    <xsl:otherwise>
                        <v1:Transfer>
                            <v11:TransferIdentifier>
                                <v11:BankID>
                                    <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "BankID" )'/>
                                </v11:BankID>
                            </v11:TransferIdentifier>
                            <v1:PurposeCode>1A1</v1:PurposeCode>
                            <v1:ChargeEventID>FIRTGS</v1:ChargeEventID>
                            <v1:ChargeOption>OUR</v1:ChargeOption>
                            <v1:WaiveChargesIndicator>true</v1:WaiveChargesIndicator>
                            <v1:TransferOrderType>CT</v1:TransferOrderType>
                            <v11:Amount currencyCode='{dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "Currency","","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )}'>
                                <xsl:value-of select="/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v11:Amount"/>
                            </v11:Amount>
                            <v1:InstructedAmount currencyCode='{dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "Currency","","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )}'>
                                <xsl:value-of select="/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v11:Amount"/>
                            </v1:InstructedAmount>
                            <v11:ValueDate>
                                <xsl:value-of select="xp20:current-date()"/>
                            </v11:ValueDate>
                            <v1:DebitExecutionDate>
                                <xsl:value-of select="xp20:current-date()"/>
                            </v1:DebitExecutionDate>
                            <v1:CreditValueDate>
                                <xsl:value-of select="xp20:current-date()"/>
                            </v1:CreditValueDate>
                            <v1:CreditExecutionDate>
                                <xsl:value-of select="xp20:current-date()"/>
                            </v1:CreditExecutionDate>
                            <v11:Rate>1.0</v11:Rate>
                            <v1:TransferReferenceNumber>
                                <xsl:value-of select="/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:RefKey"/>
                            </v1:TransferReferenceNumber>
                            <v1:AutoVerify>Y</v1:AutoVerify>
                            <xsl:choose>
                                <xsl:when test="$actionCode = 'CreateSwiftTransfer'">
                                    <v1:POType>SWIFT</v1:POType>
                                </xsl:when>
                                <xsl:when test="$actionCode = 'CreateRtgsTransfer'">
                                    <v1:POType>RTGS</v1:POType>
                                </xsl:when>
                            </xsl:choose>
                            <v1:RequestExecutionDate>
                                <xsl:value-of select="xp20:current-date()"/>
                            </v1:RequestExecutionDate>
                            <v1:AWIAddressIndicator>B</v1:AWIAddressIndicator>
                            <v1:RemitInfo>
                                <xsl:value-of select="concat('EATTA Settlement Run Ref - ',/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:RefKey)"/>
                            </v1:RemitInfo>
                            <v11:PayFromAccount>
                                <v11:AccountIdentifier>
                                    <v11:AccountID>
                                        <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "AccountID" )'/>
                                    </v11:AccountID>
                                </v11:AccountIdentifier>
                            </v11:PayFromAccount>
                            <v11:PayeeAccount>
                                <v11:AccountIdentifier>
                                    <v11:BankID>
                                        <xsl:value-of select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "BankID" ,"","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
                                    </v11:BankID>
                                    <v11:BankBIC>
                                        <xsl:value-of select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "BankBIC" ,"","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
                                    </v11:BankBIC>
                                    <v11:BranchID>
                                        <xsl:value-of select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "BranchID" ,"","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
                                    </v11:BranchID>
                                    <v11:AccountID>
                                        <xsl:value-of select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "AccountID" ,"","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
                                    </v11:AccountID>
                                </v11:AccountIdentifier>
                                <v11:PartyReference>
                                    <v11:PersonName>
                                        <v11:FullName>
                                            <xsl:value-of select='dvm:lookupValue("ChaiAccountMaster.dvm", "UserID", /v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID, "FullName" ,"","UserGroup",/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup )'/>
                                        </v11:FullName>
                                    </v11:PersonName>
                                    <v11:Address>
                                        <v11:LineOne>
                                            <xsl:value-of select="concat(/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:UserGroup,' ',/v13:ESBMsg/v13:RqData/v13:Transfer[number($recordCounter/v13:ESBMsg)]/v13:ID)"/>
                                        </v11:LineOne>
                                        <v11:LineTwo>B</v11:LineTwo>
                                        <v11:LineThree>C</v11:LineThree>
                                    </v11:Address>
                                </v11:PartyReference>
                            </v11:PayeeAccount>
                            <v1:IntermediaryAccount>
                                <v11:AccountIdentifier>
                                    <v11:BankID>
                                        <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "IntermediaryAccountBankID" )'/>
                                    </v11:BankID>
                                    <v11:BankBIC>
                                        <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "IntermediaryAccountBankBIC" )'/>
                                    </v11:BankBIC>
                                    <v11:BranchID>
                                        <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "IntermediaryAccountBranchID" )'/>
                                    </v11:BranchID>
                                    <v11:AccountID>
                                        <xsl:value-of select='dvm:lookupValue1M("AccountHolders.dvm", "AccountHolder", "CLEARING", "IntermediaryAccountID" )'/>
                                    </v11:AccountID>
                                </v11:AccountIdentifier>
                            </v1:IntermediaryAccount>
                        </v1:Transfer>
                    </xsl:otherwise>
                </xsl:choose>
            </v1:RqData>
        </v1:ESBMsg>
    </xsl:template>
</xsl:stylesheet>

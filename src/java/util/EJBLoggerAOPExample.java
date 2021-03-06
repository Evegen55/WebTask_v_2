/*
 * Copyright 2016 Evegen.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package util;

import javax.interceptor.AroundInvoke;
import javax.interceptor.InvocationContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 *
 * @author Evegen
 */
public class EJBLoggerAOPExample {
    
    private final Log log = LogFactory.getLog(EJBLoggerAOPExample.class);
    
    @AroundInvoke
    public Object logMethodEntry(InvocationContext invocationContext) throws Exception{
        //System.out.println("Entering method:" + invocationContext.getMethod().getName());
        log.info("Entering method:" + invocationContext.getMethod().getName());
        log.info(invocationContext.getParameters());
        return invocationContext.proceed();
    }
}
